//::///////////////////////////////////////////////
//:: Name hx_cut100_throw
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the PC throw the catapult to
     the ice prison.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 29, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void DelayCreate(location lLoc);
void DelayCreate2(int iType, string sRes, location lLoc);
void Throw(object oGiant);
void StartCutscene(object oPC, int iCut);

void main()
{
      object oPC = GetPCSpeaker();
      int iCut = 100;
      int iAppearance = GetAppearanceType(oPC);

      BlackScreen(oPC);

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);
      //DelayCommand(0.05, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(iAppearance), oPC, 20.0));
      DelayCommand(0.2, StartCutscene(oPC, iCut));


}

void StartCutscene(object oPC, int iCut)
{
      object oCatapult = OBJECT_SELF;
      CutSetActiveCutsceneForObject(oCatapult, iCut);

      // Waypoint target.
      object oWP = GetObjectByTag("hx_priscut_pcstart");
      CutSetActiveCutsceneForObject(oWP, iCut);

      // Setup the cutscene.
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE);
      CutJumpToLocation(0.2, oPC, GetLocation(oWP));
      CutSetCamera(0.8, oPC, CAMERA_MODE_TOP_DOWN, 145.0, 7.0, 50.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutFadeFromBlack(1.5, oPC, FADE_SPEED_MEDIUM);


      // Start the scene.
      CutPlayAnimation(2.5, oPC, ANIMATION_LOOPING_GET_MID, 1.0);
      CutPlaySound(3.2, oPC, "bf_med_hard");
      CutApplyEffectToObject(3.3, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oCatapult);
      CutSetCamera(3.4, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 9.0, 65.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      CutClearAllActions(3.6, oPC, TRUE);
      DelayCommand(3.9, Throw(oPC));

      // End scene.
      CutFadeOutAndIn(11.0, oPC, 1.5);
      CutDisableCutscene(iCut, 11.5, 11.5, RESTORE_TYPE_NONE);
      DelayCommand(12.7, DelayCreate2(OBJECT_TYPE_PLACEABLE, "catapult", GetLocation(GetObjectByTag("hx_create_catapult_wp"))));
      DelayCommand(13.0, DestroyObject(OBJECT_SELF));
}

void Throw(object oGiant)
{
    int iSpell;

    if(GetGender(oGiant) == GENDER_MALE)
    {
        iSpell = 746;
    }
    else
    {
        iSpell = 747;
    }

    object oWP = GetNearestObjectByTag("hx_frost_giantm_throw");
    location lLoc = GetLocation(oWP);

    location lScorch1 = GetLocation(GetObjectByTag("hx_scorch1_wp"));
    location lScorch2 = GetLocation(GetObjectByTag("hx_scorch2_wp"));
    location lScorch3 = GetLocation(GetObjectByTag("hx_scorch3_wp"));

    AssignCommand(oGiant, ActionCastFakeSpellAtLocation(iSpell, lLoc, PROJECTILE_PATH_TYPE_DEFAULT));
    DelayCommand(3.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    DelayCommand(2.8, DelayCreate(lScorch1));
    DelayCommand(4.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    DelayCommand(3.8, DelayCreate(lScorch2));
    DelayCommand(5.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    DelayCommand(5.0, DelayCreate(lScorch3));
    DelayCommand(6.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
}

void DelayCreate(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_scorch", lLoc);
}

void DelayCreate2(int iType, string sRes, location lLoc)
{
    CreateObject(iType, sRes, lLoc);
}
