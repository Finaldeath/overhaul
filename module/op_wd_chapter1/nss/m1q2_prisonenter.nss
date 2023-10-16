//::///////////////////////////////////////////////
//:: m1q2 Entering Prison via Main Door
//:: m1q2_PrisonEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    1. Updates and closes the Prison Key quest
       log.
    2. Updates the shared News quest log.
    3. Transitions the player from m1q2A_m1q2B.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 13, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();
    int iNewsState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_News");

    AddJournalQuestEntry("m1q2_PrisonKey", 30, oPC);
    /*
    if (iNewsState < 20)
    {
        AddJournalQuestEntry("m1q2_News", 20, oPC, TRUE, TRUE);
    }
    */
//The following is default area transition stuff copied from the generic script.
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    AssignCommand(oClicker,JumpToObject(oTarget));
}
