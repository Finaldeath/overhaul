//::///////////////////////////////////////////////
//:: q1a2_use_lockdr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Start Cutscene 1 when this door is locked and
  someone rattles it
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  march 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCutSceneReady") == 1)
    {
        object oPC = GetClickingObject();
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
    else
    {
        SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",8) ;
        SpeakOneLinerConversation();
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",0));
    }
}
