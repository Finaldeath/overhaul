//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_morph_cut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the cutscene that reveals the amulet's
     true nature to the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 22, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void Morph(object oPC);
void Morph2(object oPC);
void Morph3(object oPC);
float GetCameraFacing(object oPC, object oDevil);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
      object oDevil = GetObjectByTag("hx_out_devil");
      object oPC = GetFirstPC();
      int iCut = 70;
      float fFacing;
      float fStart = GetCameraFacing(oPC, oDevil);

      if(fStart <= 180.0)
      {
        fFacing = fStart + 140.0;
      }
      else
      {
        fFacing = fStart - 140.0;
      }

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      CutSetActiveCutsceneForObject(oDevil, iCut);
      object oSelf = OBJECT_SELF;
      CutSetActiveCutsceneForObject(oSelf, iCut);

      CutSetCutsceneMode(0.0, oPC, TRUE, FALSE);
      CutClearAllActions(0.05, oPC, TRUE);
      CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, fStart, 6.0, 40.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing, 10.0, 70.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      DelayCommand(0.15, Morph(oPC));
      //CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, VFX_IMP_KNOCK, GetLocation(oPC));
      CutApplyEffectAtLocation(0.4, oPC, DURATION_TYPE_INSTANT, VFX_IMP_POLYMORPH, GetLocation(oPC));

      //CutApplyEffectToObject2(0.7, DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_PIXIE), oPC, 12.0);
     //DelayCommand(0.4, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] What the...!?")));
      CutApplyEffectToObject2(0.9, DURATION_TYPE_TEMPORARY, EffectTimeStop(), oPC, 5.0);

      // End scene.
      //CutSpeakString(0.9, oPC, "[NOT IN STRING EDITOR] 'What the...!?'");
      DelayCommand(1.0, SetLocalInt(GetModule(), "HX_DAMAGE_TIMES", 1));
      CutDisableCutscene(iCut, 0.8, 0.8, RESTORE_TYPE_NONE);
      //DelayCommand(1.9, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] What the...!?")));
      DelayCommand(2.0, SetPlotFlag(oPC, FALSE));
    }
    if(nUser == 5555)
    {
      object oDevil = GetObjectByTag("hx_out_devil");
      object oPC = GetFirstPC();
      int iCut = 80;
      float fFacing;
      float fStart = GetCameraFacing(oPC, oDevil);

      if(fStart <= 180.0)
      {
        fFacing = fStart + 140.0;
      }
      else
      {
        fFacing = fStart - 140.0;
      }

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      CutSetActiveCutsceneForObject(oDevil, iCut);
      object oSelf = OBJECT_SELF;
      CutSetActiveCutsceneForObject(oSelf, iCut);

      CutSetCutsceneMode(0.0, oPC, TRUE, FALSE);
      CutClearAllActions(0.05, oPC, TRUE);
      CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, fStart, 6.0, 40.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing, 10.0, 70.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      DelayCommand(0.15, Morph2(oPC));
      CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWKILL, GetLocation(oPC));
      //CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, VFX_IMP_POLYMORPH, GetLocation(oPC));
      //CutApplyEffectToObject2(0.5, DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_HUGE_EARTH_ELEMENTAL, TRUE), oPC, 12.0);
      //DelayCommand(0.5, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] What is happening to me...!?")));
      CutApplyEffectToObject2(0.7, DURATION_TYPE_TEMPORARY, EffectTimeStop(), oPC, 5.0);

      // End scene.
      //CutSpeakString(0.7, oPC, "[NOT IN STRING EDITOR] 'What is happening to me!?'");
      DelayCommand(1.0, SetLocalInt(GetModule(), "HX_DAMAGE_TIMES", 2));
      CutDisableCutscene(iCut, 0.8, 0.8, RESTORE_TYPE_NONE);
      //DelayCommand(1.9, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] What is happening to me...!?")));
      DelayCommand(2.0, SetPlotFlag(oPC, FALSE));
    }
    if(nUser == 6666)
    {
      object oDevil = GetObjectByTag("hx_out_devil");
      object oPC = GetFirstPC();
      int iCut = 90;
      float fFacing;
      float fStart = GetCameraFacing(oPC, oDevil);

      if(fStart <= 180.0)
      {
        fFacing = fStart + 140.0;
      }
      else
      {
        fFacing = fStart - 140.0;
      }

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      CutSetActiveCutsceneForObject(oDevil, iCut);
      object oSelf = OBJECT_SELF;
      CutSetActiveCutsceneForObject(oSelf, iCut);

      CutSetCutsceneMode(0.0, oPC, TRUE, FALSE);
      CutClearAllActions(0.05, oPC, TRUE);
      CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, fStart, 6.0, 40.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing, 10.0, 70.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      DelayCommand(0.66, Morph3(oPC));
      //CutApplyEffectToObject2(0.25, DURATION_TYPE_PERMANENT, EffectParalyze(), oPC);
      CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, VFX_FNF_NATURES_BALANCE, GetLocation(oPC));
      //CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_UNDEAD, GetLocation(oPC));
      //CutApplyEffectToObject2(0.9, DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_WOLF, TRUE), oPC, 12.0);
      //DelayCommand(1.0, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] It's the light hitting this amulet!")));
      CutApplyEffectToObject2(1.1, DURATION_TYPE_TEMPORARY, EffectTimeStop(), oPC, 5.0);

      // End scene.
      //CutSpeakString(1.1, oPC, "[NOT IN STRING EDITOR] 'It's the light hitting this amulet!'");
      CutDisableCutscene(iCut, 1.2, 1.2, RESTORE_TYPE_NONE);
      DelayCommand(1.4, SetLocalInt(GetModule(), "HX_DAMAGE_TIMES", 3));
      DelayCommand(1.4, SetImmortal(oDevil, FALSE));
      //DelayCommand(1.9, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] It's the light hitting this amulet!")));
      DelayCommand(2.0, SetPlotFlag(oPC, FALSE));
    }
}

void Morph(object oPC)
{
    //AssignCommand(oPC, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_POLYMORPH), GetLocation(oPC)));
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_PIXIE, TRUE), OBJECT_SELF, 10.0));

}

void Morph2(object oPC)
{
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(94, TRUE), OBJECT_SELF, 10.0));
    //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] What is happening to me...!?"));
}

void Morph3(object oPC)
{
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_WOLF, TRUE), OBJECT_SELF, 10.0));
    //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 6.0);
}

float GetCameraFacing(object oPC, object oDevil)
{
    object oInvis = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_invis_devfac", GetLocation(oPC));
    AssignCommand(oInvis, SetFacingPoint(GetPosition(oDevil)));
    float fFacing = GetFacing(GetObjectByTag("hx_invis_devfac"));
    DestroyObject(oInvis);
    return fFacing;
}
