// Valsharess throne room on-enter
// setup area
// start betrayal cutscene if appropriate:
// - START CUTSCENE 701
// - Show matron summoning player as in the "win siege" secenario (using 2 different dialogs)
// - player appears and matrons invites the player to join on the platform
// - player moves to the platform
// - matron inits dialog with player
// - dialog ends
// - CONTINUE CUTSCENE AT SCRIPT: "q7b_at_endcon1"
// - matron leaves room
// - player follows matron.
// - devil stops the player
// - player moves back to the devil.
// - init dialog with devil
// - dialog ends
// - CONTINUE CUTSCENE AT SCRIPT: "q7b_at_endcon2"
// - matron returns to the room.
// - matron stops at the middle of the room.
// - matron gives a one liner.
// - init player-matron dialog (inv object)
// - matron orders guards to attack.
// - devil speaks one line and kills all her guards.
// - matron gets angry and attacks.
// - fight! fight! fight!

#include "x2_inc_cutscene"

void CallSignalEvent(int nCutscene, object oObject, int nEvent)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
         SignalEvent(oObject, EventUserDefined(101));
    }
}

void CutSignalEvent(float fDelay, object oObject, int nEvent, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallSignalEvent(nCutscene, oObject, nEvent)));
}

void CallPlayAnimation2(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        AssignCommand(oObject, PlayAnimation(nAnimation, 0.7, fLength));
    }
}

void CutPlayAnimation2(float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation(nCutscene, oObject, nAnimation, fLength)));
}


void StartCutscene701(object oPC)
{
    int CUTSCENE_NUMBER = 701;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);

    SetCustomToken(77001, GetStringByStrRef(StringToInt(Get2DAString("racialtypes", "Name", GetRacialType(oPC)))));
    SetCustomToken(77004, GetName(oPC));
    if(GetGender(oPC) == GENDER_MALE)
    {
        SetCustomToken(77002, GetStringByStrRef(4924));
        SetCustomToken(77003, GetStringByStrRef(4875));
        //SetCustomToken(77002, "male");
        //SetCustomToken(77003, "him");
    }
    else
    {
        SetCustomToken(77002, GetStringByStrRef(4925));
        SetCustomToken(77003, GetStringByStrRef(4876));
        //SetCustomToken(77002, "female");
        //SetCustomToken(77003, "her");
    }
    object oMale = GetObjectByTag("q7_male");
    if(oMale != OBJECT_INVALID)
        DestroyObject(oMale); // should habe been destroyed in one of the interjection cutscenes
    object oCamera1a = GetWaypointByTag("q7b_wp_camera1");
    object oCamera2a = GetWaypointByTag("q7b_wp_camera2");
    object oCamera3a = GetWaypointByTag("q7b_wp_camera3");
    object oCamera4a = GetWaypointByTag("q7b_wp_camera4");
    object oCamera5a = GetWaypointByTag("q7b_wp_camera5");
    object oTempCopySP = GetWaypointByTag("q7b_wp_temp_copy");
    object oMatron = GetObjectByTag("q7_matron");
    float fConvDurVal1 = CutGetConvDuration("q7_cut_val1a"); // matron asks meph to bring player
    float fConvDurVal2 = CutGetConvDuration("q7_cut_val2a"); // matron asks meph to bring player part 2
    float fConvDurVal3 = CutGetConvDuration("q7_cut_val3a"); // matron asks meph to bring player part 2
    float fConvDurMeph1 = CutGetConvDuration("q7_cut_meph1"); // meph agreeing to summon player
    object oMeph = GetObjectByTag("q7_meph");
    object oPent1 = GetNearestObjectByTag("q7_pent", oMeph, 1);
    object oPent2 = GetNearestObjectByTag("q7_pent", oMeph, 2);
    object oPent3 = GetNearestObjectByTag("q7_pent", oMeph, 3);
    object oPent4 = GetNearestObjectByTag("q7_pent", oMeph, 4);
    object oPent5 = GetNearestObjectByTag("q7_pent", oMeph, 5);
    object oPCWalk = GetWaypointByTag("q7b2_wp_pc_walk");
    object oDeekinWalk = GetWaypointByTag("q7b2_wp_deekin_walk");
    object oPCJump = GetWaypointByTag("q7b_wp_pc_sp");
    object oCircle = GetObjectByTag("q7b_circle");
    object oHiddenWP = GetWaypointByTag("q7b_wp_temp_copy");
    object oDeekin;

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oMeph, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oMatron, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oCircle, CUTSCENE_NUMBER);
    if(GetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE") == 1)
    {
        oDeekin = GetObjectByTag("x2_hen_deekin");
        CutSetActiveCutsceneForObject(oDeekin, CUTSCENE_NUMBER);
    }
    CutSetAbortDelay(CUTSCENE_NUMBER, 2.0);
    CutSetDestroyCopyDelay(CUTSCENE_NUMBER, 2.0);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oTempCopySP), "q7b2_pc_copy");
    CutFadeOutAndIn(0.0, oPC, 4.0);
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, FALSE, FALSE);
    CutSetMusic(0.0, oPC, TRACK_TEMPLEEVIL);
    CutSetFacingPoint(0.0, oMatron, GetTag(oMeph));
    CutJumpAssociateToLocation(0.0, oPC, GetLocation(oHiddenWP));
    CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 70.0, 5.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // matron demands devil to bring the player
    CutActionStartConversation(3.0, oMatron, oMatron, "q7_cut_val1a");
    //CutPlayAnimation2(4.0, oMatron, ANIMATION_LOOPING_TALK_LAUGHING, 1.5);
    CutSetCamera(fConvDurVal1 - 4.0, oPC, CAMERA_MODE_TOP_DOWN, 330.0, 0.0, 120.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionStartConversation(0.0, oMatron, oMatron, "q7_cut_val2a");
    //CutPlayAnimation2(1.0, oMatron, ANIMATION_LOOPING_TALK_FORCEFUL, 5.0);
    CutSetCamera(fConvDurVal2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCameraSpeed(0.0, oPC, 0.1);
    // devil agrees
    CutActionStartConversation(2.0, oMeph, oMeph, "q7_cut_meph1");
    CutActionMoveToObject(0.5, oPC, oCamera2a, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    // devil summons player
    CutActionCastFakeSpellAtObject(3.0, SPELL_GATE, oMeph, oMeph);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCameraSpeed(0.0, oPC, 0.6);
    CutActionMoveToLocation(0.0, oPC, GetLocation(oCamera3a), FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 4.0, 70.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    // visual effects on summoning circle
    CutSignalEvent(1.0, oCircle, 101);
    CutSetFacingPoint(0.0, oMatron, GetTag(oCircle));
    CutApplyEffectAtLocation(3.0, oPC, DURATION_TYPE_INSTANT, 471, GetLocation(oPCJump));
    // player appears in throne room

    CutJumpToObject(0.3, oCopy, oPCJump);
    // bring also Deekin
    float fChange = 0.0; // adding time if Deekin is here, so need to remove this time later
    if(oDeekin != OBJECT_INVALID)
    {
        fChange = 5.0;
        CutJumpToObject(0.0, oDeekin, oPCJump);
        CutPlayAnimation2(2.0, oDeekin, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 0.0);
        CutPlayAnimation2(1.0, oDeekin, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 0.0);
        CutPlayAnimation2(1.0, oDeekin, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.0);
        CutSetFacingPoint(2.0, oDeekin, GetTag(oCopy));
    }

    // matron invites player to join on the platform
    CutSetCamera(8.0 - fChange, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(0.0, oPC, oCamera1a);
    CutActionStartConversation(1.0, oMatron, oMatron, "q7_cut_val3a");
    CutPlayAnimation(1.0, oMatron, ANIMATION_FIREFORGET_TAUNT, 0.0);
    // player moves to the platform (with Deekin)
    CutSetCamera(fConvDurVal3 - 1.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 80.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionMoveToObject(1.0, oCopy, oPCWalk, FALSE);
    if(oDeekin != OBJECT_INVALID)
        CutActionMoveToObject(1.5, oDeekin, oDeekinWalk, TRUE);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetFacingPoint(1.0, oCopy, GetTag(oCamera1a));
    CutSetFacingPoint(0.0, oMatron, GetTag(oCamera1a));
    if(oDeekin != OBJECT_INVALID)
        CutSetFacingPoint(0.0, oDeekin, GetTag(oMatron));
    CutBeginConversation(2.0, oMatron, oPC, "q7_cut_val4a");
    // cutscene is disabled when the dialog ends.
}

void SetupArea()
{
    /*int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);*/

    object oWP1 = GetWaypointByTag("q7b_wp_fire1");
    object oWP2 = GetWaypointByTag("q7b_wp_fire2");
    effect eVis = EffectVisualEffect(349);
    vector vPos1 = GetPosition(oWP1);
    vector vPos2 = GetPosition(oWP2);
    vPos1.z -= 4.0;
    vPos2.z -= 4.0;
    location lLoc1 = Location(OBJECT_SELF, vPos1, 0.0);
    location lLoc2 = Location(OBJECT_SELF, vPos2, 0.0);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lLoc1);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lLoc2);

    /*
    // creating flames in the same z with a certain limit on x and y
    vector vPos = GetPosition(oWP);
    float Z = vPos.z - 3.0;
    float fMinX = vPos.x - 2.5;
    float fMaxX = vPos.x + 2.8;
    float fMinY = vPos.y - 1.2;
    float fMaxY = vPos.y + 1.5;
    float fDelay;

    location lLoc;
    float i, j;
    i = fMinX;
    while(i <= fMaxX)
    {
        j = fMinY;
        while(j <= fMaxY)
        {
            vPos.x = i;
            vPos.y = j;
            vPos.z = Z;
            if(FloatToInt(j) % 2 == 0)
                Z += 0.2;
            else
                Z -= 0.2;
            lLoc = Location(OBJECT_SELF, vPos, 0.0);
            //CreateObject(OBJECT_TYPE_PLACEABLE, "plc_flamelarge", lLoc);
            fDelay = (Random(3) + 1) * 0.1;

            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(505), lLoc, 9999.9));
            j += 0.5;
        }
        i += 0.5;
    }
    */
    // place lightning sources around meph
    vector vPos;
    location lLoc;

    vPos.x = 13.7;
    vPos.y = 25.7;
    vPos.z = 2.3;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap3");

    vPos.x = 16.3;
    vPos.y = 25.7;
    vPos.z = 2.3;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap4");

    vPos.x = 13.8;
    vPos.y = 25.7;
    vPos.z = 3.3;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap5");

    vPos.x = 16.3;
    vPos.y = 25.7;
    vPos.z = 3.3;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap6");

    vPos.x = 14.3;
    vPos.y = 26.0;
    vPos.z = 4.2;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap7");

    vPos.x = 15.6;
    vPos.y = 26.0;
    vPos.z = 4.2;
    lLoc = Location(OBJECT_SELF, vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q7_zap", lLoc, FALSE, "q7_zap8");

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    effect eInv = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q7_blocker")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInv, oObject);
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

}

// Jump Henchmen aside if they somehow manage to find the player after being removed from the party
void CheckHenchmen(object oObject)
{
    object oWP = GetWaypointByTag("q7b_wp_temp_copy");
    if(GetTag(oObject) == "x2_hen_nathyra" || GetTag(oObject) == "x2_hen_valen")
        AssignCommand(oObject, JumpToObject(oWP));
}

void main()
{
    object oPC = GetEnteringObject();
    CheckHenchmen(oPC);
    if(!GetIsPC(oPC))
        return;
    SetupArea();

    if(GetLocalInt(GetModule(), "X2_ENDING_STATUS") == 1) // player betreyal ending
        StartCutscene701(oPC);

}
