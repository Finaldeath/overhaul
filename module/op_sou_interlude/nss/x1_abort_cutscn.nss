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
        case 1: //Manticore emerges from lair

                //if this was the lead PC aborting - then abort for everyone
                //run the normal abort script
                if (GetLocalInt(oPC, "nCUT1MAINPC") == 1 && GetLocalInt(GetModule(), "nCut1Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut1Aborted", 1);
                   ExecuteScript("q1_cutabort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40519, oPC);
                }

                break;
         /*case 3: // portal, part 1
                if (GetLocalInt(oPC, "nCUT3MAINPC") == 1 && GetLocalInt(GetModule(), "nCut3Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut3Aborted", 1);
                   ExecuteScript("q3_cutabort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut3Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40519, oPC);
                }
                break;*/
          case 31: // portal, part 2
                if (GetLocalInt(oPC, "nCUT31MAINPC") == 1 && GetLocalInt(GetModule(), "nCut31Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut31Aborted", 1);
                   ExecuteScript("q3_cutabort2", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut31Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40519, oPC);
                }
                break;
          case 4: // focus on player
                if (GetLocalInt(oPC, "nCUT4MAINPC") == 1 && GetLocalInt(GetModule(), "nCut4Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut4Aborted", 1);
                   ExecuteScript("q4_cutabort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut4Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40519, oPC);
                }
                break;
          case 5: // Heurodis exit in portal dungeon
                if (GetLocalInt(oPC, "nCUT5MAINPC") == 1 && GetLocalInt(GetModule(), "nCut5Aborted") != 1)
                {
                   SetLocalInt(GetModule(), "nCut5Aborted", 1);
                   ExecuteScript("q5_cutabort", GetModule());
                }
                //else it was a normal PC - so he may not abort this cutscene.
                else if (GetLocalInt(GetModule(), "nCut5Aborted") != 1)
                {

                    FloatingTextStrRefOnCreature(40519, oPC);
                }
                break;


    }
}




