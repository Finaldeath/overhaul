//::///////////////////////////////////////////////
//:: m1q2 Entering Prison via Tanglebrook Estate
//:: m1q2_TangleEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    1. Updates and closes the Tanglebrook quest
       log.
    2. Updates the shared News quest log.
    3. Transitions the player from m1q2I_m1q2B.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 12, 2001
//:://////////////////////////////////////////////

void main()
{

    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    location lLoc = GetLocation(oTarget);
    AddJournalQuestEntry("m1q2_Tanglebrook", 50, oClicker);
    AssignCommand(oClicker,JumpToLocation(lLoc));
}
