//::///////////////////////////////////////////////
//:: q1a1_ent_cuttrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Start or Join cutscene 1 when the PC comes
  down the stairs if the cutscene is running
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  march 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCutSceneReady") == 1)
    {
        object oPC = GetEnteringObject();
        //Check to see if this is a possessed familiar entering the trigger
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            object oMaster = GetMaster(oPC);
            UnpossessFamiliar(oPC);
            DelayCommand(3.0, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
            return;
        }
        //AssignCommand(oPC, ClearAllActions());
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
    }

}
