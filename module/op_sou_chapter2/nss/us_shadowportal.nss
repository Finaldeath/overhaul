//::///////////////////////////////////////////////
//:: Shadow Portal (OnUse)
//:: Us_ShadowPortal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the portal's twin.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
{
    //Find the portal's twin
    string sTag = GetTag(OBJECT_SELF);
    object oMyArea = GetArea(OBJECT_SELF);
    string sMyArea = GetTag(oMyArea);
    object oPC = GetLastUsedBy();
    object oRefPoint;
    if (sMyArea == "Wizard_02")
    {
        object oShadowGem = GetItemPossessedBy(oPC, "ShadowGem");
        if (oShadowGem == OBJECT_INVALID)
        {
            //Provide error message informing them that they need a gem.
            FloatingTextStrRefOnCreature(40492, oPC, FALSE);
            return;
        }
        else
        {
            //Expend a Shadow Gem (but don't penalize for multi-clicking)
            int iStack = GetItemStackSize(oShadowGem);
            int bClickOnce = GetLocalInt(oPC, "bClickOnce");
            if (iStack > 1 &&
                bClickOnce == FALSE)
            {
                SetItemStackSize(oShadowGem, iStack-1);
            }
            else if (iStack == 1 &&
                bClickOnce == FALSE)
            {
                DestroyObject(oShadowGem);
            }
            //Pick the proper Reference Point
            oRefPoint = GetObjectByTag("Reference_Wizard_03");
            //Set the ClickOnce safety to avoid multi-clicking.
            SetLocalInt(oPC, "bClickOnce", TRUE);
            DelayCommand(1.0, SetLocalInt(oPC, "bClickOnce", FALSE));
        }
    }
    if (sMyArea == "Wizard_03")
    {
        //Pick the proper Reference Point
        oRefPoint = GetObjectByTag("Reference_Wizard_02");
    }
    object oTarget = GetNearestObjectByTag(sTag, oRefPoint);

    //Give the player XP if they haven't already received it.
    int bXP = GetLocalInt(oPC, "XP_Wizard_03");
    if (bXP == FALSE)
    {
        SetLocalInt(oPC, "XP_Wizard_03", TRUE);
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
        GiveXPToCreature(oPC, iXP);
    }

    //Create the temporary portal
    location lTarget = GetLocation(oTarget);
    object oTempPortal = CreateObject(OBJECT_TYPE_PLACEABLE, "shdowportal", lTarget, FALSE, sTag);
    effect eVFX = EffectVisualEffect(VFX_FNF_IMPLOSION);
    effect eSpawn = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    AssignCommand(oTempPortal, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal));
    AssignCommand(oTempPortal, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSpawn, oTempPortal));
    AssignCommand(oTempPortal, DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
    AssignCommand(oTempPortal, DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
    AssignCommand(oTempPortal, DelayCommand(10.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
    AssignCommand(oTempPortal, DestroyObject(oTempPortal, 14.0));

    //Jump the player to the twin.
    AssignCommand(oPC, JumpToObject(oTarget));

    //In multiplayer, suck all other players in a 5m radius in as well.
    int iNth = 1;
    object oNextPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    float fDistance = GetDistanceToObject(oNextPC);
    while (oNextPC != OBJECT_INVALID &&
           fDistance >= 0.0 &&
           fDistance <= 5.0)
    {
        //Jump them.
        AssignCommand(oNextPC, JumpToObject(oTarget));
        //Update the loop variables
        iNth++;
        oNextPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
        fDistance = GetDistanceToObject(oNextPC);
    }
}
