//::///////////////////////////////////////////////
//:: Name q2a2_enter_area                                          f
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter of House Maeviir.
    Check to see if the House Maeviir betrayal
    cutscene should be played..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 10/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"

int nCutsceneNumber = 108;

void StartBattle(object oPC);
void StartCutscene(object oPC);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //check to see if the Zessyr Plot is happening - in which case,
    //the PC jumps in and starts talking with the Maeviir matron
    //and can either fight her or betray Zessyr
    if (GetLocalInt(GetModule(), "X2_Q2AZesPlotScene") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2AZesPlotScene", 2);
        object oMaeviirMatron = GetObjectByTag("q2amaematron");
        DelayCommand(0.5, AssignCommand(oMaeviirMatron, ActionStartConversation(oPC)));

        return;
    }

    // Check to see if the Zesyyr-player dialog has been initiated and run it if not
    object oZesyyr = GetObjectByTag("q2amaezesyyr");
    int nInHouse = GetLocalInt(oZesyyr, "X2_IN_HOUSE");
    if(oZesyyr != OBJECT_INVALID && GetArea(oZesyyr) == OBJECT_SELF && nInHouse == 1)
    {
        AssignCommand(oZesyyr, ActionStartConversation(oPC, "q2azesyyrcut"));
        return;
    }

    //Only run this cutscene once
    if (GetLocalInt(GetModule(), "X2_Q2AStartCutscene108") == 0)
        return;

    DoSinglePlayerAutoSave();

    SetLocalInt(GetModule(), "X2_Q2AStartCutscene108", 1);

    object oArea = GetArea(oPC);
    string szArea = GetTag(oArea);

    //Change the music to something suspenseful.
    MusicBackgroundChangeDay(oArea, TRACK_BATTLE_FORESTBOSS);
    MusicBackgroundChangeNight(oArea, TRACK_BATTLE_FORESTBOSS);
    MusicBackgroundPlay(oArea);

    //Set a variable for the Seer and Matron death scripts so they know that
    //they are fighting the Maeviir betrayal battle.
    SetLocalInt(GetModule(), "X2_Q2ABattle2Wave1", 1);

    //Set a local int on the area to show that cutscene 108 is running
    SetLocalInt(oArea, "X2_CutScene108", 1);

    //Set Cutscene 108 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade

    object oHench;
    int i = 1;
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
        //Fade PCs to black
        BlackScreen(oPlayer);
        object oJumpTo = GetObjectByTag("cut108wp_pcstart");

        AssignCommand(oPlayer, ClearAllActions(TRUE));
        AssignCommand(oPlayer, ActionJumpToObject(oJumpTo));

        if(oPlayer == oPC)
        {
            CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
        }
        else
        {
            CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
        }

        CutSetCutsceneMode(0.0, oPlayer, TRUE, TRUE, FALSE, TRUE); // pc invis -

        //Make Each Henchmen Invis
        i = 1;
        oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            CutSetActiveCutsceneForObject(oHench, nCutsceneNumber, FALSE);
            CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench);
            i++;
            oHench = GetHenchman(oPC, i);
        }

        oPlayer = GetNextPC();
    }

    DelayCommand(1.0, StartCutscene(oPC));
}
//Betrayal cutscene - Seer and the Maeviir matron have a small conversation.
//Maeviir matron reveals her betrayal.
//Maeviir guards burst out of the sealed rooms on all sides.
//The PC and a squad of rebels arrive to save the day.
//Start combat.
void StartCutscene(object oPC)
{
    CutFadeFromBlack(0.5, oPC, FADE_SPEED_FAST, FALSE);
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oHench , nCutsceneNumber);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    // Cutscene actors and objects.
    object oMatron = GetObjectByTag("q2amaematron");
    object oSeer = GetObjectByTag("q2aseer");
    SetPlotFlag(oSeer, FALSE);
    //DEBUG
    AssignCommand(oSeer, ClearAllActions());
    object oTebomir = GetObjectByTag("q2amaecapt");
    object oGuard1 = GetObjectByTag("cut108_guard1");
    object oGuard2 = GetObjectByTag("cut108_guard2");
    object oGuard3 = GetObjectByTag("cut108_guard3");
    object oGuard4 = GetObjectByTag("cut108_guard4");
    object oGuard5 = GetObjectByTag("cut108_guard5");
    object oGuard6 = GetObjectByTag("cut108_guard6");
    object oGuard7 = GetObjectByTag("cut108_guard7");
    object oGuard8 = GetObjectByTag("cut108_guard8");
    object oGuard9 = GetObjectByTag("cut108_guard9");
    object oGuard10 = GetObjectByTag("cut108_guard10");

    object oRebel1 = GetObjectByTag("cut108_reb1");
    object oRebel2 = GetObjectByTag("cut108_reb2");
    object oRebel3 = GetObjectByTag("cut108_reb3");
    object oRebel4 = GetObjectByTag("cut108_reb4");
    object oRebel5 = GetObjectByTag("cut108_reb5");

    object oDoor1 = GetObjectByTag("cut108_door1");
    object oDoor2 = GetObjectByTag("cut108_door2");
    object oDoor3 = GetObjectByTag("cut108_door3");
    object oDoor4 = GetObjectByTag("cut108_door4");
    object oMainDoor = GetObjectByTag("at_q2a2door_interior");
    SetLocked(oDoor1, FALSE);
    SetLocked(oDoor2, FALSE);
    SetLocked(oDoor3, FALSE);
    SetLocked(oDoor4, FALSE);
    SetLocked(oMainDoor, FALSE);

    //effects

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oMatron , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oSeer , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oTebomir, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard5 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard6 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard7 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard8 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard9 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard10 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oRebel1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDoor1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDoor2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDoor3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDoor4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMainDoor , nCutsceneNumber);
    // Change the music
    object oArea = GetArea(oPC);
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations
    location lDoor1 = GetLocation(GetWaypointByTag("cut108wp_door1"));
    location lDoor2 = GetLocation(GetWaypointByTag("cut108wp_door2"));
    location lDoor3 = GetLocation(GetWaypointByTag("cut108wp_door3"));
    location lDoor4 = GetLocation(GetWaypointByTag("cut108wp_door4"));

    location lRebelSpawn = GetLocation(GetWaypointByTag("cut108wp_rebelspawn"));
    location lSeerSpawn = GetLocation(GetWaypointByTag("cut108wp_seerstart"));
    location lCopy1 = GetLocation(GetWaypointByTag("cut108wp_copy1"));
    location lReb1 = GetLocation(GetWaypointByTag("cut108_rebguard1"));
    location lReb2 = GetLocation(GetWaypointByTag("cut108_rebguard2"));
    location lReb3 = GetLocation(GetWaypointByTag("cut108_rebguard3"));
    location lReb4 = GetLocation(GetWaypointByTag("cut108_rebguard4"));
    location lReb5 = GetLocation(GetWaypointByTag("cut108_rebguard5"));

    location lGuard1 = GetLocation(GetWaypointByTag("cut108wp_guard1"));
    location lGuard2 = GetLocation(GetWaypointByTag("cut108wp_guard2"));
    location lGuard3 = GetLocation(GetWaypointByTag("cut108wp_guard3"));
    location lGuard4 = GetLocation(GetWaypointByTag("cut108wp_guard4"));
    location lGuard7 = GetLocation(GetWaypointByTag("cut108wp_guard7"));
    location lGuard8 = GetLocation(GetWaypointByTag("cut108wp_guard8"));
    location lGuard9 = GetLocation(GetWaypointByTag("cut108wp_guard9"));
    location lGuard10 = GetLocation(GetWaypointByTag("cut108wp_guard10"));
    location lSeer1 = GetLocation(GetWaypointByTag("cut108wp_seer1"));
    location lMatron1 = GetLocation(GetWaypointByTag("cut108wp_matron1"));

    //Get Dialog Durations
    float fDialog1Delay = CutGetConvDuration("cut108seer");
    float fDialog2Delay = CutGetConvDuration("cut108seer2");

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut108wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut108wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut108wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut108wp_camera3"));
    location lCamera4 = GetLocation(GetWaypointByTag("cut108wp_camera4"));
    location lCamera5 = GetLocation(GetWaypointByTag("cut108wp_camera5"));
    //Force Jump Seer into area
    SetAILevel(oSeer, AI_LEVEL_NORMAL);
    CutJumpToLocation(0.0, oSeer, lSeerSpawn, FALSE);
    //Make a copy of the PC to appear later on
    location lStart = GetLocation(GetWaypointByTag("cut108wp_copystart"));
    object oCopy =  CutCreatePCCopy(oPC, lStart, "CutBattleCopy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(3.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(35.0, oPC, CAMERA_MODE_TOP_DOWN, 75.0, 15.0, 75.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCamera(42.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 75.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCamera(47.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 12.0, 85.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutActionMoveToLocation(30.0, oPC, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(35.0, oPC, lCamera3, TRUE, FALSE);
    CutActionMoveToLocation(42.0, oPC, lCamera4, TRUE, FALSE);
    CutActionMoveToLocation(50.0, oPC, lCamera5, TRUE, FALSE);
    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Seer is talking with Matron Maeviir (conversation currently scripted to last 30 seconds)
    CutBeginConversation(2.0, oMatron, oSeer, "cut108seer", FALSE);


    //Side Doors Burst Open
    CutActionOpenDoor(30.0, oDoor1, oDoor1, FALSE);
    CutActionOpenDoor(30.0, oDoor2, oDoor2, FALSE);
    CutActionOpenDoor(35.0, oDoor3, oDoor3, FALSE);
    CutActionOpenDoor(35.0, oDoor4, oDoor4, FALSE);


    //Guardsmen move out of doorways
    CutActionMoveToLocation(31.0, oGuard9, lDoor2, TRUE);
    CutPlayAnimation(32.0, oGuard9, ANIMATION_FIREFORGET_VICTORY1, 0.0, FALSE);
    CutActionMoveToLocation(34.0, oGuard9, lGuard9, TRUE);

    CutActionMoveToLocation(36.0, oGuard7, lDoor3, TRUE);
    CutActionMoveToLocation(36.0, oGuard10, lDoor4, TRUE);
    CutActionMoveToLocation(31.0, oGuard8, lDoor1, TRUE);

    CutPlayAnimation(32.0, oGuard3, ANIMATION_FIREFORGET_TAUNT, 0.0, FALSE);
    CutActionMoveToLocation(34.0, oGuard3, lGuard3, TRUE);

    CutPlayAnimation(36.0, oGuard2, ANIMATION_FIREFORGET_VICTORY1, 0.0, FALSE);
    CutPlayAnimation(37.0, oGuard1, ANIMATION_FIREFORGET_VICTORY2, 0.0, FALSE);
    CutPlayAnimation(38.0, oGuard4, ANIMATION_FIREFORGET_VICTORY3, 0.0, FALSE);

    CutActionMoveToLocation(39.0, oGuard1, lGuard1, TRUE);
    CutActionMoveToLocation(39.5, oGuard2, lGuard2, TRUE);
    CutActionMoveToLocation(41.0, oGuard4, lGuard4, TRUE);
    CutActionMoveToLocation(43.0, oGuard7, lGuard7, TRUE);
    CutActionMoveToLocation(40.0, oGuard8, lGuard8, TRUE);
    CutActionMoveToLocation(41.0, oGuard10, lGuard10, TRUE);

    CutPlayAnimation(40.0, oGuard5, ANIMATION_LOOPING_TALK_FORCEFUL, 20.0, FALSE);
    CutPlayAnimation(42.0, oGuard6, ANIMATION_LOOPING_TALK_FORCEFUL, 20.0, FALSE);

    //PC and rebel squad appear and move towards matron
    CutActionOpenDoor(45.0, oMainDoor, oMainDoor, FALSE);
    CutJumpToLocation(46.0, oCopy, lRebelSpawn, FALSE);
    CutActionMoveToLocation(46.5, oCopy, lCopy1, TRUE);
    CutJumpToLocation(47.0, oRebel1, lRebelSpawn, FALSE);
    CutActionMoveToLocation(47.5, oRebel1, lReb1, TRUE);
    CutJumpToLocation(48.0, oRebel2, lRebelSpawn, FALSE);
    CutActionMoveToLocation(48.5, oRebel2, lReb2, TRUE);
    CutJumpToLocation(49.0, oRebel3, lRebelSpawn, FALSE);
    CutActionMoveToLocation(49.5, oRebel3, lReb3, TRUE);
    CutJumpToLocation(50.0, oRebel4, lRebelSpawn, FALSE);
    CutActionMoveToLocation(50.5, oRebel4, lReb4, TRUE);
    CutJumpToLocation(51.0, oRebel5, lRebelSpawn, FALSE);
    CutActionMoveToLocation(51.5, oRebel5, lReb5, TRUE);
    //PC speaks 'What's going on here'
    CutBeginConversation(49.5 , oSeer, oCopy, "cut108seer2", FALSE);
    CutActionMoveToLocation(51.5, oSeer, lSeer1, TRUE);

    //Maeviir MAtron curses and combat begins..
    CutPlayVoiceChat(52.5, oMatron, VOICE_CHAT_CUSS, FALSE);
    CutPlayVoiceChat(56.5, oMatron, VOICE_CHAT_ATTACK, FALSE);
    CutActionMoveToLocation(57.0, oMatron, lMatron1, TRUE);
    // End Cutscene

    CutBlackScreen(60.0, oPC);


    //Clean up actors...
    i = 1;
    oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutRemoveEffects(60.5, oHench, FALSE);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    CutDisableCutscene(nCutsceneNumber, 61.0, 61.0, RESTORE_TYPE_NONE);

    DelayCommand(61.5, StartBattle(oPC));


}
void StartBattle(object oPC)
{
    //if the cutscene has not been aborted.
    if (GetLocalInt(GetModule(), "Cutscene108Aborted") == 1)
        return;
    object oMatron = GetObjectByTag("q2amaematron");
    object oSeer = GetObjectByTag("q2aseer");
    object oTebomir = GetObjectByTag("q2amaecapt");
    object oGuard1 = GetObjectByTag("cut108_guard1");
    object oGuard2 = GetObjectByTag("cut108_guard2");
    object oGuard3 = GetObjectByTag("cut108_guard3");
    object oGuard4 = GetObjectByTag("cut108_guard4");
    object oGuard5 = GetObjectByTag("cut108_guard5");
    object oGuard6 = GetObjectByTag("cut108_guard6");
    object oGuard7 = GetObjectByTag("cut108_guard7");
    object oGuard8 = GetObjectByTag("cut108_guard8");
    object oGuard9 = GetObjectByTag("cut108_guard9");
    object oGuard10 = GetObjectByTag("cut108_guard10");

    object oRebel1 = GetObjectByTag("cut108_reb1");
    object oRebel2 = GetObjectByTag("cut108_reb2");
    object oRebel3 = GetObjectByTag("cut108_reb3");
    object oRebel4 = GetObjectByTag("cut108_reb4");
    object oRebel5 = GetObjectByTag("cut108_reb5");

    object oDoor1 = GetObjectByTag("cut108_door1");
    object oDoor2 = GetObjectByTag("cut108_door2");
    object oDoor3 = GetObjectByTag("cut108_door3");
    object oDoor4 = GetObjectByTag("cut108_door4");

    ChangeToStandardFaction(oMatron, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oTebomir, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard4, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard5, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard6, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard7, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard8, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard9, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard10, STANDARD_FACTION_HOSTILE);

    AssignCommand(oRebel1, DetermineCombatRound());
    AssignCommand(oRebel2, DetermineCombatRound());
    AssignCommand(oRebel3, DetermineCombatRound());
    AssignCommand(oRebel4, DetermineCombatRound());
    AssignCommand(oRebel5, DetermineCombatRound());
    AssignCommand(oSeer, DetermineCombatRound());

    AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
    AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
    AssignCommand(oDoor3, ActionCloseDoor(oDoor3));
    AssignCommand(oDoor4, ActionCloseDoor(oDoor4));
    SetLocked(oDoor1, TRUE);
    SetLocked(oDoor2, TRUE);
    SetLocked(oDoor3, TRUE);
    SetLocked(oDoor4, TRUE);
    FadeFromBlack(oPC, FADE_SPEED_FASTEST);
}
