//::///////////////////////////////////////////////
//:: Name hx_fends_devil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cutscene section dealing with Cania.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 22, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ending"
void main()
{
    oActor = oDevil;
    iLight = VFX_DUR_LIGHT_WHITE_10;
    // First Camera.
    fFacing1 = 90.0;
    fZoom1 = 20.0;
    fPitch1 = 80.0;
    // Second Camera.
    fFacing2 = 90.0;
    fZoom2 = 10.0;
    fPitch2 = 80.0;
    // Music.
    iTrack = 70;
    // Grave.
    iGrave = FALSE;
    if(iGrave == TRUE)
    {
        oGrave = GetNearestObjectByTag("hx_fend_headstone", oActor);
        CutSetActiveCutsceneForObject(oGrave, iCut, TRUE);
    }

    // Pause Conv.
    AssignCommand(oPC, ActionPauseConversation());

    // Remove Invis from actor.
    RemoveInvis(oActor);

    // Current PC Jump.
    lPCJump = GetLocation(GetNearestObjectByTag("hx_fend_pc_jump_wp", oActor));

    // Destroy previous light and actor.
    PurgeActorAndLight();

    // Set current actor ready.
    CutSetActiveCutsceneForObject(oActor, iCut, TRUE);

    // The light.
    oLight = GetNearestObjectByTag("hx_fend_light", oActor);
    SetCurrentActorAndLight(oActor, oLight, oGrave, iLight);

    // Start the scene.
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, fFacing1, 1.0, 1.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToLocation(0.1, oPC, lPCJumpTemp);
    CutJumpToLocation(0.3, oPC, lPCJump);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing1, fZoom1, fPitch1,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(0.7, oPC, CAMERA_MODE_TOP_DOWN, fFacing2, fZoom2, fPitch2,
               CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutSetMusic(0.6, oPC, iTrack);
    if(GetIsObjectValid(oGrave))
    {
        CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_GLOW_GREY, oGrave);
    }
    DelayCommand(0.9, PlayTeleportSound());
    DelayCommand(3.0, AssignCommand(oPC, ActionResumeConversation()));
}
