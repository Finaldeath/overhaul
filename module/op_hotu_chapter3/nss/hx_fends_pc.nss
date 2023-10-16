//::///////////////////////////////////////////////
//:: Name hx_fends_pc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cutscene section dealing with PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 22, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ending"
#include "x2_inc_toollib"

void RemoveInvis2(object oMeph)
{
    effect eEffect = GetFirstEffect(oMeph);

    //while(GetIsEffectValid(eEffect))
   // {
   //     if(GetEffectCreator(eEffect) == GetModule())
   //     {
            RemoveEffect(oMeph, eEffect);
   //     }
   //     eEffect = GetNextEffect(oMeph);
   // }
}

void main()
{
    oActor = GetObjectByTag("HX_PC_FEND_COPY");
    iLight = VFX_DUR_LIGHT_WHITE_10;
    // First Camera.
    fFacing1 = 0.0;
    fZoom1 = 15.0;
    fPitch1 = 82.0;
    // Second Camera.
    fFacing2 = 0.0;
    fZoom2 = 5.0;
    fPitch2 = 82.0;
    // Music.
    iTrack = 62;
    // Grave.
    iGrave = FALSE;
    if(iGrave == TRUE)
    {
        oGrave = GetNearestObjectByTag("hx_fend_headstone", oActor);
        CutSetActiveCutsceneForObject(oGrave, iCut, TRUE);
    }

    object oMeph = GetNearestObjectByTag("hx_fend_meph", oPC);
    CutSetActiveCutsceneForObject(oMeph, iCut, TRUE);

    //RemoveInvis2(oMeph);
    //CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectKnockdown(), oMeph);

    object oMephLight1 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 1);
    CutSetActiveCutsceneForObject(oMephLight1, iCut, TRUE);
    object oMephLight2 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 2);
    CutSetActiveCutsceneForObject(oMephLight2, iCut, TRUE);
    object oMephLight3 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 3);
    CutSetActiveCutsceneForObject(oMephLight3, iCut, TRUE);


    // Pause Conv.
    AssignCommand(oPC, ActionPauseConversation());

    // Remove Invis from actor.
    RemoveInvis(oActor);

    // Current PC Jump.
    lPCJump = GetLocation(GetNearestObjectByTag("hx_fend_pc_jump_wp", oActor));

    // Destroy previous light and actor.
    PurgeActorAndLight();

    // Set current actor ready.
    //CutSetActiveCutsceneForObject(oActor, iCut, TRUE);
    //CutPlayAnimation(0.0, oActor, ANIMATION_FIREFORGET_VICTORY1, 3.0);
    //CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_PROTECTION_EVIL_MAJOR, oActor);
    //CutApplyEffectToObject(1.9, DURATION_TYPE_PERMANENT, VFX_DUR_PROT_STONESKIN, oActor);
    //CutApplyEffectToObject2(1.9, DURATION_TYPE_PERMANENT, EffectParalyze(), oActor);

    // The light.
    oLight = GetNearestObjectByTag("hx_fend_light", oActor);
    SetCurrentActorAndLight(oActor, oLight, oGrave, iLight);

    // Start the scene.
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, fFacing1, 1.0, 1.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToLocation(0.1, oPC, lPCJumpTemp);
    CutJumpToLocation(0.3, oPC, lPCEnd);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, fFacing1, fZoom1, fPitch1,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1.2, oPC, CAMERA_MODE_TOP_DOWN, fFacing2, fZoom2, fPitch2,
               CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutSetMusic(1.1, oPC, iTrack);
    if(GetIsObjectValid(oGrave))
    {
        CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_GLOW_GREY, oGrave);
    }

    //DelayCommand(6.0, DayToNight(oPC, 2.0));
    //DelayCommand(6.2, TLResetAreaGroundTiles(GetArea(oPC), 20, 20));

    //CutDisableCutscene(iCut, 10.0, 10.0, RESTORE_TYPE_NONE);
    DelayCommand(1.6, PlayTeleportSound());
    DelayCommand(3.5, AssignCommand(oPC, ActionResumeConversation()));
    //DelayCommand(3.5, RemoveInvis(oMeph));
    //CutApplyEffectToObject(0.2, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight1);
    //CutApplyEffectToObject(0.2, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight2);
    //CutApplyEffectToObject(0.2, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight3);
}
