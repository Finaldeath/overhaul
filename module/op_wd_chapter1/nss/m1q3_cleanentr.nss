//::///////////////////////////////////////////////
//:: m1q3 Cleaning Lady's Secret Entrance
//:: m1q3_CleanEntr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates the player's journal entry, provided
    they've talked to the Cleaning Lady.

    Default area transition stuff.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();
    int iSecretEntranceState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3_SecretEntrance");

    if (iSecretEntranceState == 10)
    {
        AddJournalQuestEntry("m1q3_SecretEntrance", 20, oPC);
    }

//The following is default area transition stuff copied from the generic script.
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    AssignCommand(oClicker,JumpToObject(oTarget));
}
