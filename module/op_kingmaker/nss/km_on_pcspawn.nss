//::///////////////////////////////////////////////
//:: km_on_pcspawn
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If their are enough charges of the magic weapon
    resurrect the player is a safe location.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////

void Raise(object oPlayer);

void main()
{
    object oPC = GetLastRespawnButtonPresser();

    if (GetIsPC(oPC))
    {
        int iItemCharges = 0;
        object oWeapon = OBJECT_INVALID;
        object oHench1 = OBJECT_INVALID;
        object oHench2 = OBJECT_INVALID;
        effect eResurrect = EffectResurrection();
        string sMSG, sSafePointTag;
        location lSafePoint;

        oWeapon = GetItemPossessedBy(oPC, "os_magicweapon");
        iItemCharges = GetItemCharges(oWeapon);

        // if the weapon has more then two charges allow the resurrection
        if (iItemCharges > 2)
        {
            oHench1 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 1);
            oHench2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);

            sSafePointTag = GetLocalString(GetArea(oPC), "sSafeLocationTag");
            lSafePoint = GetLocation(GetWaypointByTag(sSafePointTag));

            sMSG = "Your Magic Weapon has revived you.";

            //Decrement uses and notify the player as to whats going on
            DelayCommand(1.0, SetItemCharges(oWeapon, iItemCharges - 2));
            DelayCommand(2.0, Raise(oPC));
            DelayCommand(3.0, FloatingTextStringOnCreature(sMSG, oPC));
        }
        else
        {
            sMSG = "Your Magic Weapon has run out of charges. Your journey is over.";

            // This should never be possable but just incase, tell the player their dead
            FloatingTextStringOnCreature(sMSG, oPC);
            PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sMSG);
        }
    }
}

void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }

        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}
