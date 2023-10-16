//::///////////////////////////////////////////////
//:: Name q2d_ent_formcut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene Script - Entering the Formian Slave Pit
    area in Undermountain Level 3.
    Drow guards will spot the PC - run to the guard room
    for reinforcements and return.
    Formian slave will join with the PCs
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 24/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void StartCutscene(object oPC);

int nCutsceneNumber = 29;

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetIsPC(oPC) == FALSE)
        return;

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oArea = GetArea(OBJECT_SELF);
        string szArea = GetTag(oArea);

        //Set a local int on the area to show that cutscene 29 is running
        SetLocalInt(oArea, "X2_CutScene29", 1);

        //Set Cutscene 29 as active for all future calls to Cut_ commands
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);

        //All PCs in the area will Fade to Black


        //Set Cutscene mode on each player in the area and do the fade
        int bMain = FALSE;
        object oPlayer = GetFirstPC();
        while (oPlayer != OBJECT_INVALID)
        {
            if (GetTag(GetArea(oPlayer)) == szArea)
            {
                AssignCommand(oPlayer, ClearAllActions());
                if(oPlayer == oPC)
                    bMain = TRUE;
                CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, bMain);

                CutSetCutsceneMode(1.0, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc not invis - keep and freeze associates
                CutFadeOutAndIn(0.0, oPlayer);
            }
            bMain = FALSE;
            oPlayer = GetNextPC();
        }
        //SetPCLocation
        CutSetLocation(0.0, oPC, FALSE);
        DelayCommand(1.0, StartCutscene(oPC));
}

void StartCutscene(object oPC)
{
    // Cutscene actors and objects.

    object oDrowLookout = GetObjectByTag("q2d_cutdrow_lookout1");
    object oMinoBrute = GetObjectByTag("q2d_cutdrow_mino1");
    object oSlaveLeader = GetObjectByTag("q2d_cutform_slaveboss");

    object oGuard1 = GetObjectByTag("q2d_cutdrow_guard3");
    object oGuard2 = GetObjectByTag("q2d_cutdrow_guard4");
    object oGuard3 = GetObjectByTag("q2d_cutdrow_guard5");

    object oGuard4 = GetObjectByTag("q2d_cutdrow_guard6");
    object oMagus = GetObjectByTag("q2d_cutdrow_magus1");
    object oMarksman = GetObjectByTag("q2d_cutdrow_archer1");

    object oArea = GetArea(oDrowLookout);

    // Change the music
    MusicBattlePlay(oArea);



    CutSetActiveCutsceneForObject(oDrowLookout, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMinoBrute, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oSlaveLeader, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMagus, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMarksman, nCutsceneNumber);


    // Cutscene waypoint locations
    location lPC1 = GetLocation(GetWaypointByTag("wp_q2dcut19_pc1"));
    location lGuardRoom = GetLocation(GetWaypointByTag("wp_q2dcut19_guardroom"));
    location lMino1 = GetLocation(GetWaypointByTag("wp_q2d_cutmino1"));
    location lLookout1 = GetLocation(GetWaypointByTag("wp_q2d_cutlookout1"));
    location lPCCopy = GetLocation(GetWaypointByTag("wp_q2dcut19_pcend"));
    location lSlave1 = GetLocation(GetWaypointByTag("wp_q2d_cutslave1"));

    //Reinforcement's waypoints
    location lGuard1 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard3_1"));
    location lGuard1a = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard3_2"));
    location lGuard2 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard4_1"));
    location lGuard2a = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard4_2"));
    location lGuard3 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard5_1"));
    location lGuard3a = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard5_2"));
    location lGuard4 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_guard6_1"));
    location lArcher1 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_archer1_1"));
    location lMagus1 = GetLocation(GetWaypointByTag("wp_q2d_cutdrow_magus1_1"));

    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("wp_q2dcut19_camera1"));
    location lCamera2 = GetLocation(GetWaypointByTag("wp_q2dcut19_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("wp_q2dcut19_camera3"));
    location lCamera4 = GetLocation(GetWaypointByTag("wp_q2dcut19_camera4"));



    //Camera should move towards the drow lookout - show the drow lookout speaking,
    //drow lookout should run to the 'guard room'.  A few drow should run out and
    //the mino brute should walk out - looking tough

    //Make a copy of the PC to move about
    location lStart = GetLocation(GetWaypointByTag("wp_q2dcut19_copystart"));
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut19Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);
    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToLocation(0.0, oPC, lCamera1, FALSE);


    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 355.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(6.0, oPC, CAMERA_MODE_TOP_DOWN, 355.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(13.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 65.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutActionMoveToLocation(6.0, oPC, lCamera2, FALSE, FALSE);
    CutActionMoveToLocation(13.0, oPC, lCamera3, FALSE, FALSE);
    CutActionMoveToLocation(17.0, oPC, lCamera4, FALSE, FALSE);

    CutSetFacingPoint(20.0, oPC, "q2d_cutdrow_mino1");

    //move the PC Copy
    CutActionMoveToLocation(2.0, oCopy, lPC1, TRUE, FALSE);
    CutPlayAnimation(11.0, oCopy, ANIMATION_LOOPING_TALK_FORCEFUL, 2.0);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Drow lookout notices the PC and runs for help
    CutSpeakStringByStrRef(5.8, oDrowLookout, 84090);
    CutActionMoveToLocation( 6.5, oDrowLookout, lLookout1, TRUE);

    //Slave leader throws his lot in with the PC
    CutActionMoveToLocation(20.0,oSlaveLeader, lSlave1, FALSE);
    CutPlayVoiceChat(23.8, oSlaveLeader, VOICE_CHAT_GATTACK1);

    //Drow come back with reinforcements.
    CutActionMoveToLocation( 12.0, oDrowLookout, lMino1, TRUE);
    CutActionMoveToLocation( 12.0, oMinoBrute, lMino1, FALSE);
    CutActionMoveToLocation( 12.0, oGuard1, lGuard1, TRUE);
    CutActionMoveToLocation( 16.0, oGuard1, lGuard1a, TRUE);
    CutActionMoveToLocation( 12.2, oGuard2, lGuard2, TRUE);
    CutActionMoveToLocation( 16.2, oGuard2, lGuard2a, TRUE);
    CutActionMoveToLocation( 12.4, oGuard3, lGuard3, TRUE);
    CutActionMoveToLocation( 16.4, oGuard3, lGuard3a, TRUE);
    CutActionMoveToLocation( 12.0, oGuard4, lGuard4, TRUE);
    CutActionMoveToLocation( 12.0, oMarksman, lArcher1, TRUE);
    CutActionMoveToLocation( 12.0, oMagus, lMagus1, TRUE);

    // End Cutscene
    CutFadeOutAndIn(28.0, oPC);
    CutSetLocation(28.0, oCopy);
    CutDestroyPCCopy(29.0, oPC, FALSE);
    CutDisableCutscene(nCutsceneNumber, 31.0, 31.0, RESTORE_TYPE_NONE);
    DelayCommand(31.0, SignalEvent(oArea, EventUserDefined(201)));
}


