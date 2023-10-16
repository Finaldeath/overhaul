//::///////////////////////////////////////////////
//:: Name hx_fends_pc3
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
    // Camera.
    fFacing1 = 330.0;
    fZoom1 = 1.0;
    fPitch1 = 88.0;


    object oMeph = GetNearestObjectByTag("hx_fend_meph", oPC);
    object oMephLight1 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 1);
    CutSetActiveCutsceneForObject(oMephLight1, iCut, TRUE);
    object oMephLight2 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 2);
    CutSetActiveCutsceneForObject(oMephLight2, iCut, TRUE);
    object oMephLight3 = GetNearestObjectByTag("hx_fend_meph_light", oPC, 3);
    CutSetActiveCutsceneForObject(oMephLight3, iCut, TRUE);


    CutApplyEffectToObject(1.5, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight1);
    CutApplyEffectToObject(1.5, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight2);
    CutApplyEffectToObject(1.5, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMephLight3);
    DelayCommand(0.3, DestroyObject(GetCurrentLight()));
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, EffectResurrection(), oMeph);
    CutSetMusic(1.3, oPC, 75);
    //CutSetCamera(1.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing1, fZoom1, fPitch1,
    //           CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutPlaySound(3.3, oMeph, "vs_nx2mephm_107");
    CutPlayAnimation(3.5, oMeph, ANIMATION_FIREFORGET_STEAL, 3.0);
    CutPlayAnimation(7.0, oMeph, ANIMATION_FIREFORGET_STEAL, 3.0);
    // Pause Conv.
    AssignCommand(oPC, ActionPauseConversation());
    DelayCommand(11.5, AssignCommand(oPC, ActionResumeConversation()));
}
