//::///////////////////////////////////////////////
//:: Name hx_water_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fires last crystal cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 30, 2003
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
    int iCut = 225;

    if(GetIsPC(oPC))
    {
        StartCutscene(oPC, iCut);
    }
}

void StartCutscene(object oPC, int iCut)
{
      CutDisableAbort(iCut);
      SetCutsceneMode(oPC, TRUE);
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC.
      object oMeph = GetNearestObjectByTag("hx_meph_crystal3", oPC);
      CutSetActiveCutsceneForObject(oMeph, iCut);
      object oFire111 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 1);
      CutSetActiveCutsceneForObject(oFire111, iCut);
      object oFire222 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 2);
      CutSetActiveCutsceneForObject(oFire222, iCut);
      object oFire333 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 3);
      CutSetActiveCutsceneForObject(oFire333, iCut);
      object oFire444 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 4);
      CutSetActiveCutsceneForObject(oFire444, iCut);
      object oFire555 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 5);
      CutSetActiveCutsceneForObject(oFire555, iCut);
      object oFire666 = GetNearestObjectByTag("hx_crystal_firewall", oMeph, 6);
      CutSetActiveCutsceneForObject(oFire666, iCut);

      object oDead1 = GetObjectByTag("hx_crystal3_explode1");
      CutSetActiveCutsceneForObject(oDead1, iCut);
      object oFire1 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 1);
      CutSetActiveCutsceneForObject(oFire1, iCut);
      object oFire2 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 2);
      CutSetActiveCutsceneForObject(oFire2, iCut);
      object oFire3 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 3);
      CutSetActiveCutsceneForObject(oFire3, iCut);
      object oFire4 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 4);
      CutSetActiveCutsceneForObject(oFire4, iCut);
      object oFire5 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 5);
      CutSetActiveCutsceneForObject(oFire5, iCut);
      object oFire6 = GetNearestObjectByTag("hx_crystal_firewall", oDead1, 6);
      CutSetActiveCutsceneForObject(oFire6, iCut);

      object oDead2 = GetObjectByTag("hx_crystal3_explode2");
      CutSetActiveCutsceneForObject(oDead2, iCut);
      object oFire11 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 1);
      CutSetActiveCutsceneForObject(oFire11, iCut);
      object oFire22 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 2);
      CutSetActiveCutsceneForObject(oFire22, iCut);
      object oFire33 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 3);
      CutSetActiveCutsceneForObject(oFire33, iCut);
      object oFire44 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 4);
      CutSetActiveCutsceneForObject(oFire44, iCut);
      object oFire55 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 5);
      CutSetActiveCutsceneForObject(oFire55, iCut);
      object oFire66 = GetNearestObjectByTag("hx_crystal_firewall", oDead2, 6);
      CutSetActiveCutsceneForObject(oFire66, iCut);

      object oSound = GetNearestObjectByTag("hx_crystal_meph_sound1", oPC);
      CutSetActiveCutsceneForObject(oSound, iCut);
      object oSound2 = GetNearestObjectByTag("hx_crystal_fire_explode", oPC);
      CutSetActiveCutsceneForObject(oSound2, iCut);
      object oSound3 = GetNearestObjectByTag("hx_crystal_door_explode", oPC);
      CutSetActiveCutsceneForObject(oSound3, iCut);
      object oSound4 = GetNearestObjectByTag("hx_crystal_door_explode2", oPC);
      CutSetActiveCutsceneForObject(oSound4, iCut);
      object oCrystal = GetObjectByTag("hx_crystal_3");
      CutSetActiveCutsceneForObject(oCrystal, iCut);
      object oSound5 = GetNearestObjectByTag("hx_crystal3_large_fire", oPC);
      CutSetActiveCutsceneForObject(oSound5, iCut);
      object oSound6 = GetNearestObjectByTag("hx_crystal3_female_scream", oPC);
      CutSetActiveCutsceneForObject(oSound6, iCut);
      object oSound7 = GetNearestObjectByTag("hx_crystal3_male_scream", oPC);
      CutSetActiveCutsceneForObject(oSound7, iCut);

      object oEnemy1 = GetObjectByTag("hx_crystal3_enemy1");
      CutSetActiveCutsceneForObject(oEnemy1, iCut);
      object oEnemy2 = GetObjectByTag("hx_crystal3_enemy2");
      CutSetActiveCutsceneForObject(oEnemy2, iCut);
      object oEnemy3 = GetObjectByTag("hx_crystal3_enemy3");
      CutSetActiveCutsceneForObject(oEnemy3, iCut);

      // Victims
      object oVictim1 = GetObjectByTag("hx_crystal3_vic1");
      CutSetActiveCutsceneForObject(oVictim1, iCut);
      object oVictim2 = GetObjectByTag("hx_crystal3_vic2");
      CutSetActiveCutsceneForObject(oVictim2, iCut);
      object oVictim3 = GetObjectByTag("hx_crystal3_vic3");
      CutSetActiveCutsceneForObject(oVictim3, iCut);
      object oVictim4 = GetObjectByTag("hx_crystal3_vic4");
      CutSetActiveCutsceneForObject(oVictim4, iCut);
      object oVictim5 = GetObjectByTag("hx_crystal3_vic5");
      CutSetActiveCutsceneForObject(oVictim5, iCut);
      object oVictim6 = GetObjectByTag("hx_crystal3_vic6");
      CutSetActiveCutsceneForObject(oVictim6, iCut);
      object oVictim7 = GetObjectByTag("hx_crystal3_vic7");
      CutSetActiveCutsceneForObject(oVictim7, iCut);

      object oCot = GetObjectByTag("hx_crystal3_sit");

      // Waypoints.
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_crystal3_pc_start_wp", oPC));
      location lPCEnd = GetLocation(GetNearestObjectByTag("hx_crystal3_pc_end_wp", oPC));
      location lMephEnd = GetLocation(GetNearestObjectByTag("hx_crystal3_meph_end_wp", oPC));
      location lVictimRun1 = GetLocation(GetObjectByTag("hx_victim1_move_wp"));
      location lVictimRun2 = GetLocation(GetObjectByTag("hx_victim2_move_wp"));
      location lVictimRun6 = GetLocation(GetObjectByTag("hx_victim6_move_wp"));
      location lEnemyRun1 = GetLocation(GetObjectByTag("hx_enemy1_move_wp"));
      location lEnemyRun2 = GetLocation(GetObjectByTag("hx_enemy2_move_wp"));

      // Setup the cutscene.
      CutFadeOutAndIn(0.0, oPC, 3.0, FADE_SPEED_FASTEST);
      //CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE, 2);

      CutSetCamera(2.4, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 3.0, 70.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(2.3, oPC, lPCStart);

      // Had to remove it since it was possible to abort the cutscene while the screen is still black
      //CutFadeFromBlack(3.0, oPC, FADE_SPEED_MEDIUM);

      // Invis on enemies.
      CutApplyEffectToObject(2.3, DURATION_TYPE_TEMPORARY, VFX_DUR_CUTSCENE_INVISIBILITY, oEnemy1, 23.5);
      CutApplyEffectToObject(2.3, DURATION_TYPE_TEMPORARY, VFX_DUR_CUTSCENE_INVISIBILITY, oEnemy2, 25.0);
      CutApplyEffectToObject(2.3, DURATION_TYPE_TEMPORARY, VFX_DUR_CUTSCENE_INVISIBILITY, oEnemy3, 26.0);

      // Ambient inn stuff.
      CutPlayAnimation(1.1, oVictim6, ANIMATION_LOOPING_SIT_CHAIR, 6.3);
      CutPlayAnimation(1.2, oVictim1, ANIMATION_LOOPING_TALK_LAUGHING, 5.0);
      CutPlayAnimation(4.4, oVictim2, ANIMATION_LOOPING_TALK_NORMAL, 4.0);
      CutPlayAnimation(1.4, oVictim3, ANIMATION_LOOPING_TALK_NORMAL, 5.0);
      CutActionMoveToObject(1.6, oVictim5, GetObjectByTag("hx_ambient_move_wp"), FALSE);
      //CutSetFacingPoint(7.0, oVictim5, "hx_crystal3_vic2");
      CutPlayAnimation(7.2, oVictim5, ANIMATION_LOOPING_TALK_FORCEFUL, 1.0);
      CutPlayAnimation(7.2, oDead2, ANIMATION_LOOPING_SPASM, 20.0);
      CutPlayAnimation(7.2, oVictim7, ANIMATION_LOOPING_TALK_PLEADING, 20.0);

      // Meph busts in.
      DelayCommand(7.0, CutPlaySoundObject(iCut, oSound3));
      DelayCommand(7.8, CutPlaySoundObject(iCut, oSound4));
      DelayCommand(8.0, CutPlaySoundObject(iCut, oSound5));

      CutApplyEffectToObject(7.7, DURATION_TYPE_PERMANENT, 349, oFire111);
      CutApplyEffectToObject(7.7, DURATION_TYPE_PERMANENT, 349, oFire222);
      CutApplyEffectToObject(7.8, DURATION_TYPE_PERMANENT, 349, oFire333);
      CutApplyEffectToObject(7.8, DURATION_TYPE_PERMANENT, 349, oFire444);
      //CutApplyEffectToObject(7.9, DURATION_TYPE_PERMANENT, 349, oFire555);
      //CutApplyEffectToObject(7.9, DURATION_TYPE_PERMANENT, 349, oFire666);

      CutPlayAnimation(10.8, oVictim1, ANIMATION_LOOPING_MEDITATE, 7.0);
      CutPlayAnimation(11.8, oVictim2, ANIMATION_LOOPING_SPASM, 7.0);

      CutSetFacingPoint(8.5, oVictim3, "hx_meph_crystal3");
      CutSetFacingPoint(8.8, oVictim5, "hx_meph_crystal3");
      DelayCommand(8.8, CutPlaySoundObject(iCut, oSound6));
      CutActionMoveToLocation(8.5, oVictim1, lVictimRun1, TRUE);
      DelayCommand(9.0, CutPlaySoundObject(iCut, oSound7));
      CutActionMoveToLocation(8.7, oVictim2, lVictimRun2, TRUE);
      CutActionMoveToLocation(10.7, oVictim6, lVictimRun6, TRUE);
      CutPlayAnimation(9.0, oVictim3, ANIMATION_LOOPING_TALK_PLEADING, 7.0);
      CutPlayAnimation(9.8, oVictim5, ANIMATION_LOOPING_WORSHIP, 9.0);

      // Start the scene.
      CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 70.0, 1.0, 80.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      CutSetCamera(11.5, oPC, CAMERA_MODE_TOP_DOWN, 22.0, 10.5, 68.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      DelayCommand(11.3, SetMusic(iCut, oPC));
      DelayCommand(7.0, DoDayToNight(iCut, oPC, 2.5));
      CutPlayAnimation(11.8, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 2.0);

      CutApplyEffectToObject(12.2, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMeph, 1.5);

      // Meph torches some innocents.
      CutApplyEffectToObject(12.1, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOW_ORANGE, oMeph, 1.3);
      CutApplyEffectAtLocation(12.2, oPC, DURATION_TYPE_INSTANT, 481, GetLocation(oDead1));
      DelayCommand(12.2, CutPlaySoundObject(iCut, oSound2));
      CutApplyEffectToObject(12.2, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_BUMP, oDead1);
      DelayCommand(12.3, CutMakeCorpseFire(iCut, oDead1));
      //CutApplyEffectToObject2(12.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oDead1);
      // Kill the saps.
      CutDeath(12.5, oVictim6, FALSE);
      CutApplyEffectAtLocation(12.5, oPC, DURATION_TYPE_INSTANT, VFX_IMP_FLAME_M, GetLocation(oVictim3));
      CutDeath(12.6, oVictim3, FALSE);
      CutDeath(12.6, oVictim5, FALSE);
      CutDeath(12.9, oVictim1, FALSE);
      CutDeath(13.0, oVictim2, FALSE);

      CutApplyEffectToObject(12.3, DURATION_TYPE_PERMANENT, 349, oFire1);
      CutApplyEffectToObject(12.4, DURATION_TYPE_PERMANENT, 349, oFire2);
      CutApplyEffectToObject(12.5, DURATION_TYPE_PERMANENT, 349, oFire3);
      CutApplyEffectToObject(12.5, DURATION_TYPE_PERMANENT, 349, oFire4);
      CutApplyEffectToObject(12.5, DURATION_TYPE_PERMANENT, 349, oFire5);
      CutApplyEffectToObject(12.5, DURATION_TYPE_PERMANENT, 349, oFire6);


      // Move camera to next victims.
      CutSetCamera(14.2, oPC, CAMERA_MODE_TOP_DOWN, 260.0, 8.5, 80.0,
                   CAMERA_TRANSITION_TYPE_FAST);

      // Cook runs in to his fate.
      CutActionMoveToObject(14.2, oVictim4, GetObjectByTag("hx_cook_move_wp"), TRUE);

      // Meph torches next set.
      CutPlayAnimation(16.2, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 2.0);

      CutApplyEffectToObject(16.6, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMeph, 1.5);
      CutApplyEffectToObject(16.5, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOW_ORANGE, oMeph, 1.3);
      CutApplyEffectAtLocation(16.6, oPC, DURATION_TYPE_INSTANT, 481, GetLocation(oDead2));
      DelayCommand(16.6, CutPlaySoundObject(iCut, oSound2));
      CutApplyEffectToObject(16.6, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_BUMP, oDead2);
      DelayCommand(16.7, CutMakeCorpseFire(iCut, oDead2));

      CutDeath(16.7, oDead2, FALSE);
      CutDeath(17.0, oVictim4, FALSE);
      CutDeath(17.5, oVictim7, FALSE);
      //CutDeath(13.0, oVictim2, FALSE);

      CutApplyEffectToObject(16.7, DURATION_TYPE_PERMANENT, 349, oFire11);
      CutApplyEffectToObject(16.7, DURATION_TYPE_PERMANENT, 349, oFire22);
      CutApplyEffectToObject(16.8, DURATION_TYPE_PERMANENT, 349, oFire33);
      CutApplyEffectToObject(16.8, DURATION_TYPE_PERMANENT, 349, oFire44);
      CutApplyEffectToObject(16.9, DURATION_TYPE_PERMANENT, 349, oFire55);
      CutApplyEffectToObject(16.9, DURATION_TYPE_PERMANENT, 349, oFire66);

      // Move camera to Meph.
      CutSetCamera(18.2, oPC, CAMERA_MODE_TOP_DOWN, 210.0, 2.0, 95.0,
                   CAMERA_TRANSITION_TYPE_FAST);

      CutPlayAnimation(20.0, oMeph, ANIMATION_FIREFORGET_TAUNT, 3.0);
      DelayCommand(20.1, CutPlaySoundObject(iCut, oSound));

      // Meph heads to the door.
      CutActionMoveToLocation(24.0, oMeph, lMephEnd, FALSE);

      // Move camera to minions.
      CutActionMoveToLocation(24.5, oPC, lPCEnd, FALSE);
      CutSetCamera(24.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 0.1, 70.0,
                   CAMERA_TRANSITION_TYPE_SLOW);

      CutActionMoveToLocation(26.8, oEnemy1, lMephEnd, TRUE);
      CutActionMoveToLocation(27.8, oEnemy2, lMephEnd, TRUE);
      CutActionMoveToLocation(28.8, oEnemy3, lMephEnd, TRUE);

      // End scene.
      CutFadeOutAndIn(30.1, oPC, 1.5);
      CutJumpToObject(30.8, oPC, oCrystal);
      CutDisableCutscene(iCut, 31.0, 31.0, RESTORE_TYPE_NONE);
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

