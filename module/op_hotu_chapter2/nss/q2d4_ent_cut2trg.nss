//::///////////////////////////////////////////////
//:: Name q2d4_ent_cut2trg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC is on the fight track and has got this
    far - the head illithid will 'deal with the pc'
    himself cutscene will fire.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 5/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void StartCutscene(object oPC);

int nCutsceneNumber = 22;

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //if this pc jumped directly into the mindflayer room and is now leaving the area..
    if (GetLocalInt(oPC, "X2_Q2D4Enterhall") == 0)
    {
        return;
    }
    //if the PC is in combat - the cutscene will not happen.
    //Just set everyone in the final room to hostile and jump them out to
    //meet the PC..
    if (GetIsInCombat(oPC) == TRUE)
    {
        //Grab all the guards and jump them outside the Brain Room
        object oMaster = GetObjectByTag("q2d_master");
        object oGuard1 = GetObjectByTag("q2d_poolguard_1");
        object oGuard2 = GetObjectByTag("q2d_poolguard_2");
        object oGuard3 = GetObjectByTag("q2d_poolguard_3");
        object oGuard4 = GetObjectByTag("q2d_poolguard_4");

        object oMasterEnd = GetWaypointByTag("wp_cut102_masterend");
        object oGuard1End = GetWaypointByTag("wp_cut102_guard1end");
        object oGuard2End = GetWaypointByTag("wp_cut102_guard2end");
        object oGuard3End = GetWaypointByTag("wp_cut102_guard3end");
        object oGuard4End = GetWaypointByTag("wp_cut102_guard4end");

        ChangeToStandardFaction(oMaster, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard4, STANDARD_FACTION_HOSTILE);

        AssignCommand(oMaster, ActionJumpToObject(oMasterEnd));
        AssignCommand(oGuard1, ActionJumpToObject(oGuard1End));
        AssignCommand(oGuard2, ActionJumpToObject(oGuard2End));
        AssignCommand(oGuard3, ActionJumpToObject(oGuard3End));
        AssignCommand(oGuard4, ActionJumpToObject(oGuard4End));

        DelayCommand(5.0, AssignCommand(oGuard1, ActionAttack(oPC)));
        DelayCommand(5.0, AssignCommand(oGuard3, ActionAttack(oPC)));

        //Make sure the door is closed and locked
        object oDoor = GetObjectByTag("q2d4_overmind_door");
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);

        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        return;
    }
    //if the Illithid are hostile and the PC hasn't 'negotiated' already with the Overmind.
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0 && GetLocalInt(GetModule(), "X2_TalkedToOvermind") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        //Fade PCs to black
        BlackScreen(oPC);

        //Do cutscene 22
        object oArea = GetArea(OBJECT_SELF);
        string szArea = GetTag(oArea);

        //Set a local int on the area to show that cutscene 102 is running
        SetLocalInt(oArea, "X2_CutScene22", 1);

        //Set Cutscene 22 as active for all future calls to Cut_ commands
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
        //All PCs in the area will Fade to Black


        //Set Cutscene mode on each player in the area and do the fade


        CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);

        CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates
        CutSetLocation(0.2, oPC, FALSE);
        CutFadeFromBlack(1.5, oPC, FADE_SPEED_FAST, FALSE);


        DelayCommand(1.0, StartCutscene(oPC));
    }

}

void StartCutscene(object oPC)
{


    // Cutscene actors and objects.

    object oOvermind = GetObjectByTag("q2d_overmind");
    object oMaster = GetObjectByTag("q2d_master");
    object oGuard1 = GetObjectByTag("q2d_poolguard_1");
    object oGuard2 = GetObjectByTag("q2d_poolguard_2");
    object oGuard3 = GetObjectByTag("q2d_poolguard_3");
    object oGuard4 = GetObjectByTag("q2d_poolguard_4");

    object oDoor = GetObjectByTag("q2d4_overmind_door");

    //effects

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oOvermind, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaster, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard4, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDoor, nCutsceneNumber);

    // Change the music

    object oArea = GetArea(oPC);

    MusicBattlePlay(oArea);

    // Cutscene waypoint locations
    //location lPC1 = GetLocation(GetWaypointByTag("wp_cut101_pc1"));
    location lMasterStart = GetLocation(GetWaypointByTag("wp_cut102_masterstart"));
    //location lMaster1 = GetLocation(GetWaypointByTag("wp_cut101_master1"));
    //location lMaster2 = GetLocation(GetWaypointByTag("wp_cut101_master2"));
    object oMaster1 = GetWaypointByTag("wp_cut101_master1");
    object oMaster2 = GetWaypointByTag("wp_cut101_master2");
    object oMasterStart = GetWaypointByTag("wp_cut102_masterstart");
    object oMasterEnd = GetWaypointByTag("wp_cut102_masterend");

    object oGuard1End = GetWaypointByTag("wp_cut102_guard1end");
    object oGuard2End = GetWaypointByTag("wp_cut102_guard2end");
    object oGuard3End = GetWaypointByTag("wp_cut102_guard3end");
    object oGuard4End = GetWaypointByTag("wp_cut102_guard4end");


    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut102_camera1"));
    object oCamera1 = GetWaypointByTag("wp_cut102_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("wp_cut101_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("wp_cut101_camera3"));

    //Make a copy of the PC to move about
    //location lStart = GetLocation(oPC);
    //SetLocalLocation(oPC, "lQ2DCut22Start", lStart);
    //object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut102Copy");
    //ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    //CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);
    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////

    CutJumpToObject(0.0, oPC, oCamera1, FALSE);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(4.5, oPC, CAMERA_MODE_TOP_DOWN, 290.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(10.0, oPC, CAMERA_MODE_TOP_DOWN, 30.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);
    //CutActionMoveToLocation(8.5, oPC, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(10.0, oPC, lCamera3, FALSE, FALSE);

    //CutSetFacingPoint(20.0, oPC, "q2d_cutdrow_mino1");


    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Jump Overmind to start location..
    CutJumpToObject(0.0, oMaster, oMasterStart, FALSE);
    //Overmind and Head Illithid will converse


    CutSpeakStringByStrRef(3.5, oOvermind, 85714 , FALSE);//"***The Intruder has not yet been stopped.***"

    CutSpeakStringByStrRef(7.5, oMaster, 85715, FALSE ); //"***I shall deal with this myself!***"

    CutActionMoveToObject(10.0, oMaster, oMaster2, TRUE, FALSE);

    //Master moves over and mentally opens door  //cast spell 693 at door for effect

    CutActionCastFakeSpellAtObject(12.5, 693, oMaster, oDoor);
    CutActionOpenDoor(14.5, oDoor, oDoor, FALSE);
    CutActionForceFollowObject(14.5, oGuard1, oMaster);
    CutActionForceFollowObject(14.5, oGuard2, oMaster);
    CutActionForceFollowObject(14.5, oGuard3, oMaster);
    CutActionForceFollowObject(14.5, oGuard4, oMaster);
    CutActionMoveToObject(15.5, oMaster, oMasterEnd, TRUE, FALSE);

    // End Cutscene
    CutFadeOutAndIn(17.0, oPC);

    CutClearAllActions(18.5, oGuard1, TRUE);
    CutClearAllActions(18.5, oGuard2, TRUE);
    CutClearAllActions(18.5, oGuard3, TRUE);
    CutClearAllActions(18.5, oGuard4, TRUE);
    CutJumpToObject(18.8, oMaster, oMasterEnd, FALSE);
    CutJumpToObject(18.8, oGuard1, oGuard1End, FALSE);
    CutJumpToObject(18.8, oGuard2, oGuard2End, FALSE);
    CutJumpToObject(18.8, oGuard3, oGuard3End, FALSE);
    CutJumpToObject(18.8, oGuard4, oGuard4End, FALSE);

    CutActionCloseDoor(18.8, oDoor, oDoor, FALSE);
    CutActionLockObject(18.8, oDoor, oDoor, FALSE);
    CutDisableCutscene(nCutsceneNumber, 19.0, 19.0, RESTORE_TYPE_NORMAL);
    DelayCommand(19.0, ChangeToStandardFaction(oMaster, STANDARD_FACTION_HOSTILE));
    DelayCommand(19.0, ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE));
    DelayCommand(19.0, ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE));
    DelayCommand(19.0, ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE));
    DelayCommand(19.0, ChangeToStandardFaction(oGuard4, STANDARD_FACTION_HOSTILE));

}


