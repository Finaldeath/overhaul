//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);
// Change Track based on night.
void SetMusic(int iCut, object oPC);
// Day/Night switch
void DoDayToNight(int iCut, object oPC, float fTime = 14.0);
// Play sound object.
void CutPlaySoundObject(int iCut, object oSound);
// Create a fire trail.
void CutCreateFire(int iCut, object oPC);
// Create corpse fire.
void CutMakeCorpseFire(int iCut, object oDead);

void main()
{
    object oPC = GetEnteringObject();
    int iCut = 215;

    if(GetIsPC(oPC))
    {
        StartCutscene(oPC, iCut);
    }
}

void StartCutscene(object oPC, int iCut)
{
      SetCutsceneMode(oPC, TRUE);
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      object oMeph = GetNearestObjectByTag("hx_meph_crystal", oPC);
      CutSetActiveCutsceneForObject(oMeph, iCut);
      object oMeph2 = GetObjectByTag("hx_meph_crystalx");
      CutSetActiveCutsceneForObject(oMeph2, iCut);
      object oDead1 = GetObjectByTag("hx_duerg_crystal");
      CutSetActiveCutsceneForObject(oDead1, iCut);
      object oDead2 = GetObjectByTag("hx_drow3_crystal");
      CutSetActiveCutsceneForObject(oDead2, iCut);

      object oSpell1 = GetObjectByTag("hx_crystal2_spell1");
      CutSetActiveCutsceneForObject(oSpell1, iCut);
      object oSpell2 = GetObjectByTag("hx_crystal2_spell2");
      CutSetActiveCutsceneForObject(oSpell2, iCut);
      object oSpell3 = GetObjectByTag("hx_crystal2_spell3");
      CutSetActiveCutsceneForObject(oSpell3, iCut);

      object oSound = GetNearestObjectByTag("hx_crystal_meph_sound1", oPC);
      CutSetActiveCutsceneForObject(oSound, iCut);
      object oSound2 = GetNearestObjectByTag("hx_crystal_fire_explode", oPC);
      CutSetActiveCutsceneForObject(oSound2, iCut);
      object oCrystal = GetObjectByTag("hx_crystal_2");
      CutSetActiveCutsceneForObject(oCrystal, iCut);

      // Waypoints.
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_crystal2_pc_start_wp", oPC));
      //location lPCJump = GetLocation(GetNearestObjectByTag("hx_crystal2_pc_jump_wp", oPC));
      location lMephEnd = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp", oPC));
      location lMephEnd2 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp2", oPC));
      location lMephEnd3 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp3", oPC));
      location lMephEnd4 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp4", oPC));
      location lMephEnd5 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp5", oPC));
      location lMephEnd6 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp6", oPC));
      location lMephEnd7 = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp7", oPC));

      // Setup the cutscene.
      //CutBlackScreen(0.0, oPC);
      CutFadeOutAndIn(0.0, oPC, 4.0);
      //CutSetCutsceneMode(0.1, oPC, TRUE, TRUE, TRUE, 2);
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE, 2);

      CutSetCamera(3.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 3.0, 76.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(3.0, oPC, lPCStart);
      // Cached Meph
      CutApplyEffectToObject(0.6, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oMeph2);
      CutApplyEffectToObject(0.8, DURATION_TYPE_PERMANENT, VFX_DUR_LIGHT_RED_10, oMeph);

      //CutFadeFromBlack(3.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      CutActionMoveToLocation(3.5, oMeph, lMephEnd, FALSE);
      CutActionMoveToLocation(4.5, oPC, lMephEnd, FALSE);

      // Random spell effects going off.
      CutApplyEffectToObject(7.5, DURATION_TYPE_INSTANT, VFX_IMP_HARM, oSpell1);
      CutApplyEffectToObject(16.0, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_MONSTER_2, oSpell2);
      CutApplyEffectToObject(23.0, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_30, oSpell3);
      //CutApplyEffectToObject(39.0, DURATION_TYPE_INSTANT, VFX_FNF_PWSTUN, oSpell1);

      // Meph kills with his eyes.
      CutSetCamera(11.0, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 3.0, 74.0,
                   CAMERA_TRANSITION_TYPE_FAST);
      CutClearAllActions(12.0, oMeph, TRUE);
      CutApplyEffectToObject(12.9, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOW_ORANGE, oMeph, 1.3);
      CutApplyEffectAtLocation(13.0, oPC, DURATION_TYPE_INSTANT, 481, GetLocation(oDead1));
      DelayCommand(13.0, CutPlaySoundObject(iCut, oSound2));
      CutApplyEffectToObject(13.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_BUMP, oDead1);
      DelayCommand(13.3, CutMakeCorpseFire(iCut, oDead1));
      //DelayCommand(13.0, SetImmortal(oDead1, FALSE));
      CutApplyEffectAtLocation(13.1, oPC, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, GetLocation(oDead1));
      CutApplyEffectToObject(13.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oDead1);
      CutPlaySound(13.2, oPC, "vs_ndwarfm1_dead");
      //CutDeath(13.2, oDead1, FALSE);
      CutPlayAnimation(12.8, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 2.0);
      CutApplyEffectToObject(13.2, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMeph, 1.5);
      //
      CutSetCamera(14.5, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 3.0, 76.0,
                   CAMERA_TRANSITION_TYPE_VERY_FAST);

      // Meph moves to next stop.
      CutActionMoveToLocation(15.5, oMeph, lMephEnd2, FALSE);
      CutActionMoveToLocation(16.5, oPC, lMephEnd2, FALSE);

      // Meph kills with his eyes, part 2.
      CutSetCamera(25.8, oPC, CAMERA_MODE_TOP_DOWN, 20.0, 3.0, 74.0,
                   CAMERA_TRANSITION_TYPE_VERY_FAST);
      CutClearAllActions(26.0, oMeph, TRUE);
      CutApplyEffectToObject(26.9, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOW_ORANGE, oMeph, 1.3);
      CutApplyEffectAtLocation(27.0, oPC, DURATION_TYPE_INSTANT, 481, GetLocation(oDead2));
      DelayCommand(27.0, CutPlaySoundObject(iCut, oSound2));
      //DelayCommand(27.0, SetImmortal(oDead2, FALSE));
      CutApplyEffectToObject(27.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_BUMP, oDead2);
      DelayCommand(27.3, CutMakeCorpseFire(iCut, oDead2));
      CutApplyEffectAtLocation(27.1, oPC, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, GetLocation(oDead2));
      CutApplyEffectToObject(27.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oDead2);
      CutPlaySound(27.2, oPC, "vs_nfenthim_dead");
      //CutDeath(27.2, oDead2, FALSE);
      CutPlayAnimation(26.6, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 2.0);
      CutApplyEffectToObject(27.2, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMeph, 1.5);
      //
      CutSetCamera(28.8, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 3.0, 75.0,
                   CAMERA_TRANSITION_TYPE_FAST);

      // Meph transforms into biggun version.
      CutActionMoveToLocation(28.8, oPC, lMephEnd4, TRUE);
      CutPlayAnimation(30.8, oMeph, 22, 2.15);
      CutApplyEffectAtLocation(31.5, oPC, DURATION_TYPE_INSTANT, 464, lMephEnd2);
      DelayCommand(31.8, CutPlaySoundObject(iCut, oSound2));
      CutApplyEffectToObject(32.9, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oMeph);
      CutJumpToLocation(32.92, oMeph, lMephEnd3);
      DelayCommand(31.0, DoDayToNight(iCut, oPC, 3.0));
      CutCreateObject(33.32, oPC, OBJECT_TYPE_CREATURE, "hx_meph_crystal2", lMephEnd2, EFFECT_TYPE_INVALIDEFFECT);
      DelayCommand(36.5, CutPlaySoundObject(iCut, oSound));
      CutSetCamera(33.9, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 1.5, 100.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);
      CutActionMoveToLocation(32.6, oPC, lMephEnd6, FALSE);
      DelayCommand(34.2, CutCreateFire(iCut, oPC));
      // Delay commands are fine here. He is destroyed on an abort.
      DelayCommand(40.0, AssignCommand(GetObjectByTag("hx_meph_crystal2"), ActionMoveToLocation(lMephEnd7)));
      CutActionMoveToLocation(37.1, oPC, lMephEnd7, FALSE);
      //DelayCommand(38.0, AssignCommand(GetObjectByTag("hx_meph_crystal2"), ClearAllActions(TRUE)));
      //DelayCommand(38.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), GetObjectByTag("hx_meph_crystal2")));
      // End scene.
      CutFadeOutAndIn(43.1, oPC, 1.5);
      CutJumpToObject(43.5, oPC, oCrystal);
      CutDisableCutscene(iCut, 44.0, 44.0, RESTORE_TYPE_NONE);
}

void SetMusic(int iCut, object oPC)
{
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        object oArea = GetArea(oPC);
        int iTrack = MusicBackgroundGetNightTrack(oArea);
        MusicBackgroundStop(oArea);
        MusicBackgroundChangeDay(oArea, iTrack);
        MusicBackgroundPlay(oArea);
    }
}


void DoDayToNight(int iCut, object oPC, float fTime = 14.0)
{
     if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
     {
        DayToNight(oPC, fTime);
     }
}

// Play sound object.
void CutPlaySoundObject(int iCut, object oSound)
{
    if(iCut == GetLocalInt(oSound, "nCutsceneNumber"))
    {
       SoundObjectPlay(oSound);
    }
}

// Create fire trail.
void CutCreateFire(int iCut, object oPC)
{
    int x = 1;
    object oWP = GetNearestObjectByTag("hx_crsytal_cut_fire", oPC, x);
    float fDelay = 0.0;

    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
       while(GetIsObjectValid(oWP))
       {
           DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), GetLocation(oWP)));
           fDelay = fDelay + 0.13;
           x = x + 1;
           oWP = GetNearestObjectByTag("hx_crsytal_cut_fire", oPC, x);
       }
    }
}

// Create corpse fire.
void CutMakeCorpseFire(int iCut, object oDead)
{
    if(iCut == GetLocalInt(oDead, "nCutsceneNumber"))
    {
       CreateObject(OBJECT_TYPE_PLACEABLE, "hx_crystal_fire", GetLocation(oDead));
    }
}

