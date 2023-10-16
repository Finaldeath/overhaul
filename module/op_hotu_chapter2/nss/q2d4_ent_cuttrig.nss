//::///////////////////////////////////////////////
//:: Name q2d4_ent_cuttrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC enters the Grand Hall for the first time
    and the mindflayers are already hostile to him..
    Start cutscene 101 - showing the Overmind and the
    head mindflayer sending guards after him..
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 5/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"

void StartCutscene(object oPC);
void SpawnInGuards();

int nCutsceneNumber = 21;

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    //if this pc jumped directly into the mindflayer room and is now leaving the area..
    if (GetLocalInt(oPC, "X2_Q2D4Enterhall") == 0)
        return;

    //if the Illithid are hostile and the PC hasn't 'negotiated' already with the Overmind.
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0 && GetLocalInt(GetModule(), "X2_TalkedToOvermind") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        //Fade PCs to black
        BlackScreen(oPC);

        SpawnInGuards();

        object oArea = GetArea(OBJECT_SELF);
        string szArea = GetTag(oArea);
        //if the Illithids are hostile - activiate the triggers that will spawn some encounters for the PCs
        SetLocalInt(oArea, "nTriggersActive", 1);

        //Set a local int on the area to show that cutscene 101 is running
        SetLocalInt(oArea, "X2_CutScene21", 1);

        //Set Cutscene 101 as active for all future calls to Cut_ commands
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
        //All PCs in the area will Fade to Black


        //Set Cutscene mode on each player in the area and do the fade

        object oPlayer = GetFirstPC();
        while (oPlayer != OBJECT_INVALID)
        {
            if (GetTag(GetArea(oPlayer)) == szArea)
            {
                AssignCommand(oPlayer, ClearAllActions());
                if(oPlayer == oPC)
                {
                    CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
                }
                else
                {
                    CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
                }


                //CutDisableAbort(nCutsceneNumber);
                CutSetCutsceneMode(1.0, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

                CutFadeFromBlack(2.5, oPlayer, FADE_SPEED_FAST, FALSE);
            }

            oPlayer = GetNextPC();
        }
        CutSetLocation(0.0, oPC, FALSE);
        DelayCommand(1.0, StartCutscene(oPC));
    }
}

void StartCutscene(object oPC)
{

    //Set Variable on the PC so that they can jump to the teleport pad without
    //activating it..

    SetLocalInt(oPC, "X2_Q2DTPFromCity", 1);

    // Cutscene actors and objects.

    object oOvermind = GetObjectByTag("q2d_overmind");
    object oMaster = GetObjectByTag("q2d_master");
    object oGuard1 = GetObjectByTag("cut101_guard1");
    object oGuard2 = GetObjectByTag("cut101_guard2");
    object oGuard3 = GetObjectByTag("cut101_guard3");
    object oDoor = GetObjectByTag("q2d4_overmind_door");

    //effects

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oOvermind, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaster, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDoor, nCutsceneNumber);

    // Change the music

    object oArea = GetArea(oPC);

    MusicBattlePlay(oArea);

    // Cutscene waypoint locations
    location lPC1 = GetLocation(GetWaypointByTag("wp_cut101_pc1"));
    location lMaster1 = GetLocation(GetWaypointByTag("wp_cut101_master1"));
    location lMaster2 = GetLocation(GetWaypointByTag("wp_cut101_master2"));
    location lMasterStart = GetLocation(GetWaypointByTag("wp_cut102_masterstart"));
    location lGuard1 = GetLocation(GetWaypointByTag("wp_cut101_guard1"));
    location lGuard1b = GetLocation(GetWaypointByTag("wp_cut101_guard1b"));
    location lGuard2 = GetLocation(GetWaypointByTag("wp_cut101_guard2"));
    location lGuard2b = GetLocation(GetWaypointByTag("wp_cut101_guard2b"));
    location lGuard3 = GetLocation(GetWaypointByTag("wp_cut101_guard3"));
    location lGuard3b = GetLocation(GetWaypointByTag("wp_cut101_guard3b"));

    location lGuard1Jump = GetLocation(GetWaypointByTag("wp_cut101end_thrall1"));
    location lGuard2Jump = GetLocation(GetWaypointByTag("wp_cut101end_thrall2"));
    location lGuard3Jump = GetLocation(GetWaypointByTag("wp_cut101end_thrall3"));
    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut101_camera1"));
    object oCamera1 = GetWaypointByTag("wp_cut101_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("wp_cut101_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("wp_cut101_camera3"));


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////

    CutJumpToObject(0.5, oPC, oCamera1, FALSE);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 340.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 30.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);
    //CutActionMoveToLocation(7.5, oPC, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(15.0, oPC, lCamera3, FALSE, FALSE);

    //CutSetFacingPoint(20.0, oPC, "q2d_cutdrow_mino1");


    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Overmind and Head Illithid will converse

    CutSpeakStringByStrRef(3.5, oOvermind, 85712 , FALSE);//"***The Intruder draws close.***"
    //Master moves towards brain.
    CutActionMoveToLocation(4.5, oMaster, lMaster1, FALSE, FALSE);

    CutSpeakStringByStrRef(7.5, oMaster, 85713, FALSE );//"***I shall dispatch thralls at once.***"

    //Hulks walk to the door
    CutActionMoveToObject(11.5, oGuard1, oDoor, FALSE, FALSE);
    CutActionMoveToLocation(11.8, oGuard2, lGuard2, FALSE, FALSE);
    CutActionMoveToLocation(11.5, oGuard3, lGuard3, FALSE, FALSE);

    //Master moves over and mentally opens door  //cast spell 693 at door for effect
    CutActionMoveToLocation(13.4, oMaster, lMaster2, FALSE, FALSE);
    CutActionCastFakeSpellAtObject(17.5, 693, oMaster, oDoor);
    CutActionOpenDoor(20.0, oDoor, oDoor, FALSE);

    CutActionMoveToLocation(20.5, oMaster, lMasterStart, FALSE, FALSE);

    CutActionMoveToLocation(23.5, oGuard1, lGuard1b, FALSE, FALSE);
    CutActionMoveToLocation(23.8, oGuard2, lGuard2b, FALSE, FALSE);
    CutActionMoveToLocation(23.5, oGuard3, lGuard3b, FALSE, FALSE);

    // End Cutscene
    CutFadeOutAndIn(23.0, oPC);

    //Clean up actors...
    CutActionCloseDoor(24.5, oDoor, oDoor, FALSE);
    //Jump guards to ambush PC
    CutJumpToLocation(24.8, oGuard1, lGuard1Jump, FALSE);
    CutJumpToLocation(24.8, oGuard2, lGuard2Jump, FALSE);
    CutJumpToLocation(24.8, oGuard3, lGuard3Jump, FALSE);

    CutDisableCutscene(nCutsceneNumber, 25.0, 25.0, RESTORE_TYPE_NORMAL);
    DelayCommand(25.0, ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE));
    DelayCommand(25.0, ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE));
    DelayCommand(25.0, ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE));
    DelayCommand(25.5, AssignCommand(oGuard1, DetermineCombatRound()));
    DelayCommand(25.5, AssignCommand(oGuard2, DetermineCombatRound()));
    DelayCommand(25.5, AssignCommand(oGuard3, DetermineCombatRound()));

}

void SpawnInGuards()
{
    location lUmber1Spawn = GetLocation(GetWaypointByTag("wp_cut101guard1start"));
    location lUmber2Spawn = GetLocation(GetWaypointByTag("wp_cut101guard2start"));
    location lUmber3Spawn = GetLocation(GetWaypointByTag("wp_cut101guard3start"));

    location lGuard1 = GetLocation(GetWaypointByTag("wp_cut101pguard1start"));
    location lGuard2 = GetLocation(GetWaypointByTag("wp_cut101pguard2start"));
    location lGuard3 = GetLocation(GetWaypointByTag("wp_cut101pguard3start"));
    location lGuard4 = GetLocation(GetWaypointByTag("wp_cut101pguard4start"));

    location lMasterSpawn = GetLocation(GetWaypointByTag("wp_cut101masterstart"));

    CreateObject(OBJECT_TYPE_CREATURE, "cut101_guard", lUmber1Spawn, FALSE, "cut101_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_guard", lUmber2Spawn, FALSE, "cut101_guard2");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_guard", lUmber3Spawn, FALSE, "cut101_guard3");

    CreateObject(OBJECT_TYPE_CREATURE, "q2d_poolguard_", lGuard1, FALSE, "q2d_poolguard_1");
    CreateObject(OBJECT_TYPE_CREATURE, "q2d_poolguard_", lGuard2, FALSE, "q2d_poolguard_2");
    CreateObject(OBJECT_TYPE_CREATURE, "q2d_poolguard_", lGuard3, FALSE, "q2d_poolguard_3");
    CreateObject(OBJECT_TYPE_CREATURE, "q2d_poolguard_", lGuard4, FALSE, "q2d_poolguard_4");

    CreateObject(OBJECT_TYPE_CREATURE, "q2d_master", lMasterSpawn);
}


