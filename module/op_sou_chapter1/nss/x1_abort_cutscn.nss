//::///////////////////////////////////////////////
//:: Name x1_abort_cutscn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene aborted script.
    Check to see which cutscene has been aborted by
    the player and run the appropriate script to
    remove the player from the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Feb 4/ 03
//::
//::
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    //switch based on which cutscene the player was in.
    switch (GetLocalInt(oPC, "nCutsceneNumber"))
    {
        case 1: //Kobold attack on Drogan's home.

                //if this was the lead PC aborting - then abort for everyone
                //run the normal abort script
                if (GetLocalInt(oPC, "nCUT1MAINPC") == 1 && GetLocalInt(GetModule(), "nCut1Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut1Aborted", 1);
                   ExecuteScript("q1a_cut1abort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40421, oPC);
                }

                break;
        case 31: // J'Nah communicates with Heurodis
                //if this was the lead PC aborting - then abort for everyone
                //run the normal abort script
                if (GetLocalInt(oPC, "nCUT31MAINPC") == 1 && GetLocalInt(GetModule(), "nCut31Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut31Aborted", 1);
                   ExecuteScript("q3c_cut31abort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut31Aborted") != 1)
                {
                    FloatingTextStrRefOnCreature(40421, oPC);
                }

                break;

    }
}




