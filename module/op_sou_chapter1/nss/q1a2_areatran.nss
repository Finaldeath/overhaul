//::///////////////////////////////////////////////
//:: Name: q1a2_areatran
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this area transition is used - check to see
    if cutscene#1 - the battle on the main floor - has
    not run, or is running.
    If it has not run - start the cutscene - if it is running
    jump the PC using this transition into the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 31/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();

    //if the cutscene hasn't run yet - start the cutscene
    if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 0)
    {
        if (GetLocalInt(oPC, "X1_nCut1DoOnce") != 1)
        {
            SetLocalInt(oPC, "X1_nCut1DoOnce", 1);
            AssignCommand(oPC, ClearAllActions());
            object oDrogan = GetObjectByTag("Drogan");
            SetLocalInt(GetModule(), "X1_CUT1RUNNING", 1);
            SetLocalInt(oPC, "nQ1AStairs", 1);
            SetLocalInt(oPC, "nCUT1MAINPC", 1);

            ExecuteScript("q1a_cut1start", oDrogan);
        }
    }
    //else if the cutscene is running - jump PC into the scene
    else if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 1)
    {
        if (GetLocalInt(oPC, "X1_nCut1DoOnce") != 1)
        {
            SetLocalInt(oPC, "X1_nCut1DoOnce", 1);
            AssignCommand(oPC, ClearAllActions());
            SetLocalInt(oPC, "nQ1AStairs", 1);
            if (GetLocalInt(oPC, "nCUT1MAINPC") != 1)
                ExecuteScript("q1a_cut1join", oPC);
        }
    }
    //else I am just a normal area transition
    else
    {
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        location lLoc = GetLocation(oTarget);

        AssignCommand(oPC, JumpToLocation(lLoc));
    }



}
