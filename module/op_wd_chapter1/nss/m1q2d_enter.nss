//::///////////////////////////////////////////////
//:: m1q2 Entering Prison Level 3
//:: m1q2_TangleEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates the Prison Break quest log when the
    player uses either of the m1q2C_m1q2D area
    transitions.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 13, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();

    AddJournalQuestEntry("m1q2_PrisonBreak", 40, oPC);

//The following is default area transition stuff copied from the generic script.
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    AssignCommand(oClicker,JumpToObject(oTarget));
}
