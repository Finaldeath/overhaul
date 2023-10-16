//::///////////////////////////////////////////////
//:: Witch Wake: On Player Rest
//:: WW_OnPlayerRest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle WW's time-limited, partial HP recovery
     resting system.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 15, 2003
//:://////////////////////////////////////////////

void main()
{
    int iRestType = GetLastRestEventType();
    object oPC = GetLastPCRested();

    if (iRestType == REST_EVENTTYPE_REST_STARTED)
    {
        //If they aren't well-rested (or are on Easy Difficulty), calculate how
        //many hitpoints should be healed.
        int iCurrentHP = GetCurrentHitPoints(oPC);
        float fNextRest = GetLocalFloat(oPC, "fNextRest");
        if (fNextRest < 59.0 ||
            GetGameDifficulty() == GAME_DIFFICULTY_EASY)
        {
            int iMaxHP = GetMaxHitPoints(oPC);
            int iDamageTaken = iMaxHP - iCurrentHP;
            int iConMod = GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
            int iHitDice = GetHitDice(oPC);
            int iHealing;
            if (iDamageTaken == 0)
            {
                iHealing = 0;
            }
            else
            {
                iHealing = (iDamageTaken / 3) + (iConMod * iHitDice);
                if (iHealing < 1)
                {
                    iHealing = 1;
                }
            }
            //Save the values out for future reference.
            SetLocalInt(oPC, "iPreRestHP", iCurrentHP);
            SetLocalInt(oPC, "iHealing", iHealing);
        }
        //Cancel their rest if they're already well-rested
        else
        {
            //Determine how long until next rest.
            float fNextRest = GetLocalFloat(oPC, "fNextRest");

            //Convert into minutes
            int iNextRest = FloatToInt(fNextRest/60.0);

            //Send error message.
            string sMessage = "You are not tired enough to rest yet";
            string sMessage2 = "Try again in "+IntToString(iNextRest)+" minute(s).";
            FloatingTextStringOnCreature(sMessage, oPC, FALSE);
            FloatingTextStringOnCreature(sMessage2, oPC, FALSE);

            //Update iPreRestHP to their iCurrentHP so as not to redamage them on cancellation.
            SetLocalInt(oPC, "iPreRestHP", iCurrentHP);

            //Cancel their rest.
            AssignCommand(oPC, ClearAllActions());
        }
    }

    //If they cancel their rest, remove any partial healing.
    if (iRestType == REST_EVENTTYPE_REST_CANCELLED)
    {
        //If they've canceled after partially healing.
        int iPreRestHP = GetLocalInt(oPC, "iPreRestHP");
        int iCurrentHP = GetCurrentHitPoints(oPC);
        if (iCurrentHP > iPreRestHP)
        {
            //Send error message.
            string sMessage = "You rise unrested";
            FloatingTextStringOnCreature(sMessage, oPC, FALSE);

            //Remove any partial healing.
            int iDamageToApply = iCurrentHP - iPreRestHP;
            if (iDamageToApply > 0)
            {
                effect eDamageToApply = EffectDamage(iDamageToApply, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageToApply, oPC);
            }
        }
    }

    //If they complete their rest, set their hit points accordingly.
    if (iRestType == REST_EVENTTYPE_REST_FINISHED)
    {
        int iPreRestHP = GetLocalInt(oPC, "iPreRestHP");
        int iCurrentHP = GetCurrentHitPoints(oPC);
        int iHealing = GetLocalInt(oPC, "iHealing");
        int iNewHP = iPreRestHP + iHealing;
        int iDamageToApply = iCurrentHP - iNewHP;

        //Apply the requisite damage.
        if (iDamageToApply > 0)
        {
            effect eDamageToApply = EffectDamage(iDamageToApply, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageToApply, oPC);
        }

        //Send an appropriate feedback message
        string sHealing = IntToString(iHealing);
        string sMessage = "Resting healed "+sHealing+" hit points";
        FloatingTextStringOnCreature(sMessage, oPC, FALSE);

        //Scale the delay between rests according to game difficulty.
            //Transpose the difficulty down one setting as VERY EASY doesn't
            //actually exist. Then multiply by 3 minutes per setting.
                //VERY EASY = 0 minutes (Not player-accessible)
                //EASY      = 0 minutes
                //NORMAL    = 3 minutes
                //CORE D&D  = 6 minutes
                //DIFFICULT = 9 minutes
        int iCurrentRestDifficulty = GetGameDifficulty()-1;
        SetLocalInt(oPC, "iPreviousRestDifficulty", iCurrentRestDifficulty);
        float fNextRest = iCurrentRestDifficulty * 180.0;
        SetLocalFloat(oPC, "fNextRest", fNextRest);

        //Execute a recurring timer script on the player to track the Next
        //Rest, taking changes to the game difficulty into account.
        if (fNextRest > 59.0)
        {
            DelayCommand(60.0, ExecuteScript("ww_resttimer", oPC));
        }
    }
}
