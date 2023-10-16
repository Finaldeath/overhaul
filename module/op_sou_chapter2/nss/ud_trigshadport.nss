//::///////////////////////////////////////////////
//:: Shadow Portal Trigger (User-Defined)
//:: UD_TrigShadPort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Shadow Portal
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void SpawnShadovar(location lTarget)
{
    object oShadovar;
    int iShadovarType = Random(4)+1;
    switch (iShadovarType)
    {
        case 1:
            oShadovar = CreateObject(OBJECT_TYPE_CREATURE, "towershadarcher", lTarget);
            break;

        case 2:
            oShadovar = CreateObject(OBJECT_TYPE_CREATURE, "towershadwizard", lTarget);
            break;

        case 3:
            oShadovar = CreateObject(OBJECT_TYPE_CREATURE, "towershadcleric", lTarget);
            break;

        case 4:
            oShadovar = CreateObject(OBJECT_TYPE_CREATURE, "towershadwarrior", lTarget);
            break;
    }

    //Save the Shadovar out as a local object on the trigger to prevent over-spawning.
    SetLocalObject(OBJECT_SELF, "Shadovar", oShadovar);

    //Move the Shadovar off the portal node.
    AssignCommand(oShadovar, ActionMoveAwayFromLocation(lTarget, TRUE, 1.0));
}

void ShadowPortalEvent()
{
    SignalEvent(OBJECT_SELF, EventUserDefined(5008));
}

void main()
{
    int bActive = GetLocalInt(OBJECT_SELF, "ShadowPortalActive");
    object oShadovar = GetLocalObject(OBJECT_SELF, "Shadovar");

    if (bActive == TRUE && GetIsDead(oShadovar) == TRUE)
    {
        //Identify the relevant portal target
        object oTarget = GetNearestObject(OBJECT_TYPE_WAYPOINT);
        string sTarget = GetTag(oTarget);
        location lTarget = GetLocation(oTarget);

        //Create the temporary portal at the portal target
        object oTempPortal = CreateObject(OBJECT_TYPE_PLACEABLE, "shdowportal", lTarget, FALSE, sTarget);
        effect eVFX = EffectVisualEffect(VFX_FNF_IMPLOSION);
        effect eSpawn = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
        AssignCommand(oTempPortal, DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
        AssignCommand(oTempPortal, DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSpawn, oTempPortal)));
        AssignCommand(oTempPortal, DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
        AssignCommand(oTempPortal, DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
        AssignCommand(oTempPortal, DelayCommand(10.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTempPortal)));
        AssignCommand(oTempPortal, DestroyObject(oTempPortal, 14.0));

        //Spawn a random shadovar on a brief delay
        DelayCommand(2.0, SpawnShadovar(lTarget));

        //Add journal entry
        int bDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DoOnce_Journ_Wizard_30");
        if (bDoOnce == FALSE)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "DoOnce_Journ_Wizard_30", FALSE);
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            //AddJournalQuestEntry("Journ_Wizard_30", 1, oPC, TRUE, TRUE);
        }
    }

    //Refire the event in 12-30 seconds.
    int iTimer = Random(18)+12;
    float fTimer = IntToFloat(iTimer);
    DelayCommand(fTimer, ShadowPortalEvent());
}
