//::///////////////////////////////////////////////
//:: Name hx_puz_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will start the well cutscene with the
     beholder.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 16, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void StartCutscene(object oPC, int iCut);
void main()
{
    object oPC = GetFirstPC();
    int iCut = 52;

    //Set well to be open
    SetLocalInt(GetModule(), "NW_WELLROOMOPEN", 10);
    //variable for Durnan's conversation
    SetLocalInt(GetModule(), "DurnanSpoke", 3);

    // Start the cutscene.
    DelayCommand(0.1, StartCutscene(oPC, iCut));
}

void StartCutscene(object oPC, int iCut)
{
      // Voices.
      string sPC;
      string sLinu = "vs_nx2linuf_dead";
      string sDurnan = "vs_nx2durnm_hit2";
      string sDaelan = "vs_nx2daelm_dead";

      if(GetGender(oPC) == GENDER_FEMALE)
      {
        sPC = "vs_frangerf_dead";
      }
      else
      {
        sPC = "vs_fvengaum_dead";
      }

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC.
      object oDurnan = GetObjectByTag("q2adurnan");
      CutSetActiveCutsceneForObject(oDurnan, iCut);
      object oDurnan2 = GetObjectByTag("q2adurnan2");
      CutSetActiveCutsceneForObject(oDurnan2, iCut);
      object oTomi = GetObjectByTag("pre_tomi");
      CutSetActiveCutsceneForObject(oTomi, iCut);
      object oDaelan = GetObjectByTag("pre_daelan");
      CutSetActiveCutsceneForObject(oDaelan, iCut);
      object oLinu = GetObjectByTag("pre_linu");
      CutSetActiveCutsceneForObject(oLinu, iCut);
      object oSharwyn = GetObjectByTag("pre_sharwyn");
      CutSetActiveCutsceneForObject(oSharwyn, iCut);
      object oBeholder = GetObjectByTag("cut52beholder");
      CutSetActiveCutsceneForObject(oBeholder, iCut);
      object oDoor = GetObjectByTag("welldoor");
      CutSetActiveCutsceneForObject(oDoor, iCut);
      object oLever = GetObjectByTag("welllever");
      CutSetActiveCutsceneForObject(oLever, iCut);
      object oBeholderInvis = GetObjectByTag("c52_invis_beholder");
      CutSetActiveCutsceneForObject(oBeholderInvis, iCut);
      object oBeholderInvis2 = GetObjectByTag("c52_invis_beholder2");
      CutSetActiveCutsceneForObject(oBeholderInvis2, iCut);
      object oBrazier = GetObjectByTag("c52_brazier_explode");
      CutSetActiveCutsceneForObject(oBrazier, iCut);
      object oFire = GetObjectByTag("cut52_fire");
      CutSetActiveCutsceneForObject(oFire, iCut);


      // Waypoints. "bp" placed in tags to show my waypoints amongst the ones
      // already there.
      location lPCWP = GetLocation(GetObjectByTag("bp_cut52_pcstart_wp"));
      location lPCCopyWP = GetLocation(GetObjectByTag("bp_cut52_pccopystart_wp"));
      location lDurnanWP = GetLocation(GetObjectByTag("bp_cut52_durnanstart_wp"));
      location lTomiWP = GetLocation(GetObjectByTag("bp_cut52_tomistart_wp"));
      location lDaelanWP = GetLocation(GetObjectByTag("bp_cut52_daelanstart_wp"));
      location lLinuWP = GetLocation(GetObjectByTag("bp_cut52_linustart_wp"));
      location lSharwynWP = GetLocation(GetObjectByTag("bp_cut52_sharwynstart_wp"));
      location lBeholderWP = GetLocation(GetObjectByTag("bp_cut52_beholderstart_wp"));
      location lDurnanMoveWP = GetLocation(GetObjectByTag("bp_cut52_durnanmove_wp"));
      location lSharwynEndWP = GetLocation(GetObjectByTag("bp_cut52_sharwynend_wp"));
      location lDaelanEndWP = GetLocation(GetObjectByTag("bp_cut52_daelanend_wp"));
      location lTomiEndWP = GetLocation(GetObjectByTag("bp_cut52_tomiend_wp"));
      location lLinuEndWP = GetLocation(GetObjectByTag("bp_cut52_linuend_wp"));
      location lDaelanMidWP = GetLocation(GetObjectByTag("bp_cut52_daelanmid_wp"));
      location lTomiMidWP = GetLocation(GetObjectByTag("bp_cut52_tomimid_wp"));
      location lTemp = GetLocation(GetObjectByTag("bp_temp_beholder_wp"));
      location lSharwynMidWP = GetLocation(GetObjectByTag("wp_q2awellatk_1"));

      // PC Copy.
      object oPCCopy = CutCreatePCCopy(oPC, lPCCopyWP, "WELL_PC_COPY");
      CutSetActiveCutsceneForObject(oPCCopy, iCut);
      object oPCCopy2 = GetObjectByTag("WELL_PC_COPY2");
      CutSetActiveCutsceneForObject(oPCCopy2, iCut);
      ChangeToStandardFaction(oPCCopy, STANDARD_FACTION_COMMONER);

      // Setup the cutscene.
      CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, TRUE);

      CutSetCamera(0.4, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 8.0, 65.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutActionOpenDoor(0.4, oDoor, oDoor);
      CutCreateObject(0.6, oPC, OBJECT_TYPE_CREATURE, "cut5beholder", lTemp, EFFECT_TYPE_INVALIDEFFECT);
      CutFadeFromBlack(2.0, oPC, FADE_SPEED_FAST);

      // Start the scene. Jump actors into place. Do it twice for anti-bump
      // placement.

      // Clear their actions first.
      CutClearAllActions(0.2, oPC, TRUE);
      //CutClearAllActions(0.2, oPCCopy, TRUE);
      CutClearAllActions(0.2, oDurnan, TRUE);
      CutClearAllActions(0.2, oTomi, TRUE);
      CutClearAllActions(0.2, oDaelan, TRUE);
      CutClearAllActions(0.2, oLinu, TRUE);
      CutClearAllActions(0.2, oSharwyn, TRUE);
      // First jump.
      CutJumpToLocation(0.3, oPC, lPCWP);
      //CutJumpToLocation(0.3, oPCCopy, lPCCopyWP);
      CutJumpToLocation(0.3, oDurnan, lDurnanWP);
      CutJumpToLocation(0.3, oTomi, lTomiWP);
      CutJumpToLocation(0.3, oDaelan, lDaelanWP);
      CutJumpToLocation(0.3, oLinu, lLinuWP);
      CutJumpToLocation(0.3, oSharwyn, lSharwynWP);
      // Anti-bump.
      CutJumpToLocation(0.7, oPC, lPCWP);
      //CutJumpToLocation(0.7, oPCCopy, lPCCopyWP);
      CutJumpToLocation(0.7, oDurnan, lDurnanWP);
      CutJumpToLocation(0.7, oTomi, lTomiWP);
      CutJumpToLocation(0.7, oDaelan, lDaelanWP);
      CutJumpToLocation(0.7, oLinu, lLinuWP);
      CutJumpToLocation(0.7, oSharwyn, lSharwynWP);

      // Store the location for the PC to return to.
      //CutSetLocation(1.0, oPCCopy);

      // The scene.
      CutPlayAnimation(2.5, oDurnan, ANIMATION_LOOPING_GET_MID, 0.5);
      CutPlayAnimation(2.9, oLever, ANIMATION_PLACEABLE_DEACTIVATE, 3.0);
      CutActionCloseDoor(3.5, oDoor, oDoor);
      CutActionMoveToLocation(3.6, oDurnan, lDurnanMoveWP, FALSE);
      CutSetFacingPoint(6.3, oDurnan, "pre_tomi");
      CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 315.0, 10.0, 75.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      CutClearAllActions(7.18, oDurnan, TRUE);
      CutPlayAnimation(7.2, oDurnan, ANIMATION_LOOPING_TALK_PLEADING, 1.0);
      CutSpeakStringByStrRef(7.4, oDurnan, 83966);
      CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 315.0, 5.0, 65.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      CutClearAllActions(14.68, oDurnan, TRUE);
      CutPlayAnimation(14.7, oDurnan, ANIMATION_LOOPING_TALK_PLEADING, 1.0);
      CutSpeakStringByStrRef(15.0, oDurnan, 83967);
      // Can use create Beholder since abort script will kill it.
      CutSetMusic(17.5, oPC, 48);
      CutPlaySound(18.6, oPC, "as_mg_telepin1");
      CutCreateObject(17.8, oPC, OBJECT_TYPE_CREATURE, "cut52_beholder", lBeholderWP, EFFECT_TYPE_INVALIDEFFECT);
      CutApplyEffectAtLocation(17.9, oPC, DURATION_TYPE_INSTANT, 133, lBeholderWP);
      CutApplyEffectAtLocation(18.3, oPC, DURATION_TYPE_INSTANT, 134, lBeholderWP);

      // Kill cached beholder.
      //DelayCommand(23.0, SetPlotFlag(GetObjectByTag("cut52beholder"), FALSE));
      DelayCommand(24.0, DestroyObject(GetObjectByTag("cut5beholder")));

      // Turn Durnan and the PC to their doom.
      CutSetFacingPoint(19.2, oSharwyn, "cut52_beholder");
      CutPlayAnimation(19.8, oSharwyn, ANIMATION_LOOPING_TALK_FORCEFUL, 1.0);
      CutSpeakStringByStrRef(19.9, oSharwyn, 83968);
      CutSetFacingPoint(20.5, oDurnan, "cut52_beholder");
      CutSetFacingPoint(20.7, oPCCopy, "cut52_beholder");

      CutSetCamera(21.0, oPC, CAMERA_MODE_TOP_DOWN, 235.0, 8.0, 75.0,
                   CAMERA_TRANSITION_TYPE_FAST);

      // Again, non-cutscene commands are fine since aborting scene kills beholder.
      DelayCommand(21.1, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.15, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(776, oDurnan2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(21.2, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.25, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(777, oDurnan2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(21.3, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.35, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(778, oDurnan2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(21.4, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.45, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(779, oPCCopy2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(21.5, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.55, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(780, oPCCopy2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(21.6, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(21.65, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(776, oPCCopy2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));

      CutPlaySound(21.45, oDurnan, sDurnan);
      CutPlayAnimation(21.5, oDurnan, ANIMATION_LOOPING_DEAD_BACK, 25.0);
      CutPlaySound(21.8, oPC, sPC);
      CutPlayAnimation(22.0, oPCCopy, ANIMATION_LOOPING_DEAD_BACK, 25.0);

      //CutActionMoveToLocation(24.0, oSharwyn, lDurnanMoveWP, TRUE);
      //CutPlayAnimation(25.0, oSharwyn, ANIMATION_LOOPING_GET_LOW, 3.0);

      CutSetCamera(23.0, oPC, CAMERA_MODE_TOP_DOWN, 150.0, 9.0, 70.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);
      CutSpeakStringByStrRef(23.5, oTomi, 83971);
      CutActionAttack(24.0, oTomi, oBeholderInvis);
      CutActionAttack(23.6, oSharwyn, oBeholderInvis2);
      CutActionMoveToLocation(23.8, oDaelan, GetLocation(GetObjectByTag("bp_daelan_move_wp")), TRUE);
      // Beholder shoots at NPCs and brazier.
      DelayCommand(24.1, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(24.15, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(776, lSharwynWP, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(24.2, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(24.25, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(777, lLinuWP, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(24.3, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(24.35, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(778, lTomiWP, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(24.4, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));

      DelayCommand(24.5, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(24.55, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(779, oBrazier, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(24.6, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(24.65, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtObject(780, oBrazier, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      CutApplyEffectAtLocation(25.1, oBrazier, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, GetLocation(oBrazier));
      CutSetPlotFlag(25.2, oBrazier, FALSE);
      CutApplyEffectAtLocation(24.5, oBrazier, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oBrazier));
      CutApplyEffectToObject2(25.3, DURATION_TYPE_INSTANT, EffectDamage(1000), oBrazier);
      CutDestroyObject(25.4, oFire);
      CutApplyEffectAtLocation(24.3, oPC, DURATION_TYPE_INSTANT, VFX_IMP_DEATH, lLinuWP);
      CutPlaySound(24.2, oLinu, sLinu);
      CutPlayAnimation(24.4, oLinu, ANIMATION_LOOPING_DEAD_FRONT, 4.5);
      CutPlaySound(25.2, oDaelan, sDaelan);
      CutPlayAnimation(25.4, oDaelan, ANIMATION_LOOPING_DEAD_BACK, 4.0);

      DelayCommand(27.1, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(27.15, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(776, GetLocation(oLinu), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(27.2, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(27.25, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(777, GetLocation(oLinu), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(27.3, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      DelayCommand(27.35, AssignCommand(GetObjectByTag("cut52_beholder"), ActionCastSpellAtLocation(778, GetLocation(oSharwyn), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(27.4, AssignCommand(GetObjectByTag("cut52_beholder"), ClearAllActions(TRUE)));
      CutActionAttack(25.8, oSharwyn, oBeholderInvis2);
      CutSetCamera(27.0, oPC, CAMERA_MODE_TOP_DOWN, 50.0, 16.0, 80.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);

      // Beholder flees
      DelayCommand(29.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(2), GetObjectByTag("cut52_beholder")));
      CutPlaySound(29.2, oPC, "as_mg_telepout1");
      DelayCommand(30.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), GetObjectByTag("cut52_beholder")));

      CutClearAllActions(30.2, oTomi, TRUE);
      CutClearAllActions(30.2, oDaelan, TRUE);
      CutClearAllActions(30.2, oLinu, TRUE);
      CutClearAllActions(30.2, oSharwyn, TRUE);
      CutActionMoveToLocation(30.5, oSharwyn, lSharwynMidWP, FALSE);

      //CutSpeakStringByStrRef(30.8, oDaelan, 83972);
      CutActionMoveToLocation(33.5, oTomi, lTomiMidWP, FALSE);
      CutActionMoveToLocation(35.0, oDaelan, lDaelanMidWP, FALSE);
      CutSpeakStringByStrRef(33.0, oSharwyn, 83974);

      CutSetCamera(31.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 3.0, 80.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);

      CutActionMoveToObject(33.5, oSharwyn, oLever, TRUE);
      CutPlayAnimation(34.5, oSharwyn, ANIMATION_LOOPING_GET_MID, 0.5);
      CutPlayAnimation(34.9, oLever, ANIMATION_PLACEABLE_DEACTIVATE, 3.0);
      CutActionOpenDoor(35.1, oDoor, oDoor);

      // Everyone runs to the door.
      CutActionForceMoveToLocation(35.5, oSharwyn, lSharwynEndWP, TRUE, 5.0);
      CutActionForceMoveToLocation(35.5, oTomi, lTomiEndWP, TRUE, 5.0);
      CutActionForceMoveToLocation(36.2, oDaelan, lDaelanEndWP, TRUE, 5.0);
      CutActionForceMoveToLocation(38.6, oLinu, lLinuEndWP, TRUE, 3.2);

      CutSetCamera(38.5, oPC, CAMERA_MODE_TOP_DOWN, 260.0, 0.3, 85.0,
                   CAMERA_TRANSITION_TYPE_SLOW);

      CutJumpToObject(41.9, oSharwyn, GetObjectByTag("bp_cut52_sharwynend_wp"));
      CutJumpToObject(41.9, oTomi, GetObjectByTag("bp_cut52_tomiend_wp"));
      CutJumpToObject(41.9, oDaelan, GetObjectByTag("bp_cut52_daelanend_wp"));
      CutJumpToObject(41.9, oLinu, GetObjectByTag("bp_cut52_linuend_wp"));
      CutActionCloseDoor(42.0, oDoor, oDoor);

      CutSetFacingPoint(38.2, oSharwyn, "bp_cut52_tomimid_wp");
      CutSetFacingPoint(40.5, oTomi, "bp_cut52_tomimid_wp");

      // End the scene.
      CutFadeOutAndIn(42.9, oPC, 2.5);
      CutSetMusic(43.1, oPC, 54);
      CutJumpToLocation(43.2, oPC, lPCCopyWP);
      CutDestroyObject(43.3, oDaelan);
      CutDestroyObject(43.3, oSharwyn);
      CutDestroyObject(43.3, oTomi);
      CutDestroyObject(43.3, oLinu);
      //CutPlayAnimation(44.4, oPC, ANIMATION_LOOPING_DEAD_BACK, 3.0);
      CutDisableCutscene(iCut, 43.5, 43.5, RESTORE_TYPE_NONE);
}
