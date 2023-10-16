//::///////////////////////////////////////////////
//:: Name cutscene_102
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Initial Chapter Entry cutscene
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"

int nCutsceneNumber = 102;

void StartCutscene(object oPC);
void StartSeerDialog(object oSeer, object oPC);
void ReturnDeekin();

void main()
{
    //Freeze Deekin in the extra room if he came along
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oDeekin);

    //Get the PC however we are going to do it for this cutscene
    object oPC = OBJECT_SELF;

    object oArea = GetArea(oPC);
    string szArea = GetTag(oArea);

    //Set a local int on the area to show that cutscene 101 is running
    SetLocalInt(oArea, "X2_CutScene102", 1);

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
            //Fade PCs to black
            BlackScreen(oPlayer);
            if(oPlayer == oPC)
            {
                CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
                CutSetLocation(0.0, oPC);
            }
            else
            {
                CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
            }
            //CutDisableAbort(nCutsceneNumber);
            CutSetCutsceneMode(1.0, oPlayer, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE); // pc invis - keep and freeze associates
            CutFadeFromBlack(2.5, oPlayer, FADE_SPEED_FAST, FALSE);
        }
        oPlayer = GetNextPC();
    }


    DelayCommand(1.0, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("q2aseer");
    object oImloth = GetObjectByTag("q2arebimloth");
    object oGuard1 = GetObjectByTag("cut102_guard1");
    object oGuard2 = GetObjectByTag("cut102_guard2");
    object oGuard3 = GetObjectByTag("cut102_guard3");
    object oGuard4 = GetObjectByTag("cut102_guard4");
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");

    //Get Dialog Durations
    float fDialog1Delay = CutGetConvDuration("cut102seer");
    float fDialog2Delay = CutGetConvDuration("cut102seer2");
    //effects
    effect eVis1 = EffectVisualEffect(VFX_FNF_WORD);
    effect eVis2 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oSeer , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oNathyrra , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oImloth , nCutsceneNumber);

    // Cutscene waypoint locations
    location lGuard1_1 = GetLocation(GetWaypointByTag("cut102wp_guard1_1"));
    location lGuard1_2 = GetLocation(GetWaypointByTag("cut102wp_guard1_2"));
    location lGuard2_1 = GetLocation(GetWaypointByTag("cut102wp_guard2_1"));
    location lGuard2_2 = GetLocation(GetWaypointByTag("cut102wp_guard2_2"));
    location lGuard3_1 = GetLocation(GetWaypointByTag("cut102wp_guard3_1"));
    location lGuard3_2 = GetLocation(GetWaypointByTag("cut102wp_guard3_2"));
    location lGuard4_1 = GetLocation(GetWaypointByTag("cut102wp_guard4_1"));
    location lGuard4_2 = GetLocation(GetWaypointByTag("cut102wp_guard4_2"));
    location lSeer1 = GetLocation(GetWaypointByTag("cut102wp_seer1"));
    location lImloth1 = GetLocation(GetWaypointByTag("cut102wp_imloth1"));
    location lImloth2 = GetLocation(GetWaypointByTag("cut102wp_imloth2"));

    location lPCTeleport = GetLocation(GetWaypointByTag("wp_cut102_pcstart"));
    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut102wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut102wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut102wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut102wp_camera3"));

    //Make a copy of the PC to move about
    location lStart = GetLocation(GetWaypointByTag("cut102wp_copystart"));
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut102Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.2, oPC, oCamera1, FALSE);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 3.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(0.4, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 8.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(0.0 + fDialog1Delay, oPC, CAMERA_MODE_TOP_DOWN, 280.0, 5.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(2.0 + fDialog1Delay, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 15.0, 60.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(7.5 + fDialog1Delay, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 5.0, 65.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(8.5 + fDialog1Delay, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 3.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(16.0 + fDialog1Delay, oPC, CAMERA_MODE_TOP_DOWN, 340.0, 2.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutActionMoveToLocation(2.0 + fDialog1Delay, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(15.0 + fDialog1Delay, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Seer is talking with her companions
    CutBeginConversation(2.0, oImloth, oSeer, "cut102seer", FALSE);

    //add float delay to all subsequent commands

    //PC and Henchmen teleport in
    CutApplyEffectAtLocation(0.0 + fDialog1Delay, oPC, DURATION_TYPE_INSTANT, VFX_FNF_WORD, lPCTeleport);
    CutApplyEffectAtLocation(0.0 + fDialog1Delay, oPC, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, lPCTeleport);
    CutJumpToLocation(0.5 + fDialog1Delay, oCopy, lPCTeleport);
    CutJumpToLocation(0.5 + fDialog1Delay, oNathyrra, lPCTeleport);
    CutJumpToLocation(0.5 + fDialog1Delay, oNathyrra, lPCTeleport);

    //Guardsmen shout
    //CutPlayVoiceChat(3.5 + fDialog1Delay, oGuard1, VOICE_CHAT_ENEMIES);
    CutSpeakStringByStrRef(1.5 + fDialog1Delay, oGuard2, 85747); //"Look out! The Enemy has found a way in."
    CutSpeakStringByStrRef(2.0 + fDialog1Delay, oGuard3, 85748);//"Protect the Seer!"

    //Guardsmen move to intercept
    CutActionMoveToLocation(1.75 + fDialog1Delay, oGuard1, lGuard1_1, TRUE);
    CutActionMoveToLocation(2.0 + fDialog1Delay, oGuard2, lGuard2_1, TRUE);
    CutActionMoveToLocation(2.0 + fDialog1Delay, oGuard3, lGuard3_1, TRUE);
    CutActionMoveToLocation(2.25 + fDialog1Delay, oGuard4, lGuard4_1, TRUE);
    CutActionMoveToLocation(1.75 + fDialog1Delay, oImloth, lImloth1, TRUE);

    //Seer Shouts out
    //CutPlayVoiceChat(6.0 + fDialog1Delay, oSeer, VOICE_CHAT_STOP);
    CutSpeakStringByStrRef(4.0 + fDialog1Delay, oSeer, 85749); //"No - wait a moment."
    //Seer moves forward
    CutActionMoveToLocation(4.5 + fDialog1Delay, oSeer, lSeer1, TRUE);

    //Guards move out of the way
    CutActionMoveToLocation(4.75 + fDialog1Delay, oGuard1, lGuard1_2, FALSE);
    CutActionMoveToLocation(5.0 + fDialog1Delay, oGuard2, lGuard2_2, FALSE);
    CutActionMoveToLocation(5.0 + fDialog1Delay, oGuard3, lGuard3_2, FALSE);
    CutActionMoveToLocation(5.25 + fDialog1Delay, oGuard4, lGuard4_2, FALSE);
    CutActionMoveToLocation(4.75 + fDialog1Delay, oImloth, lImloth2, FALSE);

    //Seer talks to Nathyrra
    CutBeginConversation(8.0 + fDialog1Delay, oNathyrra, oSeer, "cut102seer2", FALSE);

    //Seer turns and moves to the PC..

    //Guards face PC
    CutSetFacingPoint(8.0 + fDialog1Delay, oGuard1, "Cut102Copy", FALSE);
    CutSetFacingPoint(10.0 + fDialog1Delay, oGuard2, "Cut102Copy", FALSE);
    CutSetFacingPoint(9.0 + fDialog1Delay, oGuard3, "Cut102Copy", FALSE);
    CutSetFacingPoint(9.0 + fDialog1Delay, oGuard4, "Cut102Copy", FALSE);
    CutSetFacingPoint(8.0 + fDialog1Delay, oImloth, "Cut102Copy", FALSE);
    //Seer speaks with the PC

    //Fade to Black

    //At the end of the cutscene Seer will init with the player


    // End Cutscene

    CutFadeOutAndIn(18.0 + fDialog1Delay + fDialog2Delay, oPC);


    //Clean up actors...


    CutDisableCutscene(nCutsceneNumber, 20.0+ fDialog1Delay + fDialog2Delay, 22.0+ fDialog1Delay + fDialog2Delay, RESTORE_TYPE_NORMAL);

    DelayCommand(20.5 + fDialog1Delay + fDialog2Delay, StartSeerDialog(oSeer, oPC));

    DelayCommand(21.0 + fDialog1Delay + fDialog2Delay, ReturnDeekin());

}

void StartSeerDialog(object oSeer, object oPC)
{
    if (GetLocalInt(oSeer, "nCutscene102Aborted") == 1)
        return;
    if (IsInConversation(oSeer) == FALSE)
    {
        AssignCommand(oSeer, ActionStartConversation(oPC));
    }

}
void ReturnDeekin()
{
    if (GetLocalInt(GetModule(), "X2_nCutscene102Aborted") == 1)
        return;
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        effect eEffect = GetFirstEffect(oDeekin);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENE_PARALYZE)
                RemoveEffect(oDeekin, eEffect);

            eEffect = GetNextEffect(oDeekin);
        }
        object oTarget = GetWaypointByTag("wp_q2a1_deekpostcut");
        DelayCommand(1.0, AssignCommand(oDeekin, JumpToObject(oTarget)));
    }
}





