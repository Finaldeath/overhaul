//::///////////////////////////////////////////////
//:: Name os_cut_tempfight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the cutscene that occurs when the PC
    looks into the telescope in the magic shoppe.
    What they will witness is the drow and their
    allies attacking the university. There will
    be many magical attacks with NPCs dying and
    objects being destroyed.

    This is a template cutscene of a fight from XP2
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 10, 2002
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void StartCutscene(object oPC);
void SetTelescope(object oPC);

int nCutsceneNumber = 10;

void main()
{
     object oPC = GetEnteringObject();


     if(GetIsPC(oPC)) {
          CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
          CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);

          StartCutscene(oPC);
     }
}

void StartCutscene(object oPC)
{
     // Stops on the camera path.
     location lStop1 = GetLocation(GetWaypointByTag("wp_cut10_stop1"));
     location lStop2 = GetLocation(GetWaypointByTag("wp_cut10_stop2"));
     location lStop3 = GetLocation(GetWaypointByTag("wp_cut10_stop3"));
     location lStop4 = GetLocation(GetWaypointByTag("wp_cut10_stop4"));
     location lStop5 = GetLocation(GetWaypointByTag("wp_cut10_stop5"));
     location lStop6 = GetLocation(GetWaypointByTag("wp_cut10_stop6"));
     location lStop7 = GetLocation(GetWaypointByTag("wp_cut10_stop7"));

     // Cutscene objects, and locations spawned in.
     location lStatue1 = GetLocation(GetWaypointByTag("wp_cut10_statue1"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "cut10_statue1", lStatue1, 0);
     location lBarrel1 = GetLocation(GetWaypointByTag("wp_cut10_barrel1"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "cut10_barrel1", lBarrel1, 0);
     location lBarrel2 = GetLocation(GetWaypointByTag("wp_cut10_barrel2"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "cut10_barrel2", lBarrel2, 0);
     location lCart = GetLocation(GetWaypointByTag("wp_cut10_cart"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_PLACEABLE, "cut10_cart", lCart, 0);

     // Locations for the "bad guys" and other bad guy objects
     location lBad1 = GetLocation(GetWaypointByTag("wp_cut10_bad1"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow", lBad1, 0);
     location lBad2 = GetLocation(GetWaypointByTag("wp_cut10_bad2"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow", lBad2, 0);
     location lBad3 = GetLocation(GetWaypointByTag("wp_cut10_bad3"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_dwiz", lBad3, 0);
     location lBad4 = GetLocation(GetWaypointByTag("wp_cut10_bad4"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow", lBad4, 0);
     location lBad5 = GetLocation(GetWaypointByTag("wp_cut10_bad5"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow", lBad5, 0);
     location lBad6 = GetLocation(GetWaypointByTag("wp_cut10_bad6"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_dwiz", lBad6, 0);
     location lBad7 = GetLocation(GetWaypointByTag("wp_cut10_bad7"));
     CutCreateObject(0.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow", lBad7, 0);
     location lBad8 = GetLocation(GetWaypointByTag("wp_cut10_bad8"));
     location lBad9 = GetLocation(GetWaypointByTag("wp_cut10_bad9"));
     location lBad10 = GetLocation(GetWaypointByTag("wp_cut10_bad10"));
     location lBad11 = GetLocation(GetWaypointByTag("wp_cut10_bad11"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_CREATURE, "Cut10_Ram_o", lBad11, 0);
     // Reset positions for the drow wizards that aren't spawned in.
     location lWiz1 = GetLocation(GetWaypointByTag("cut10_reset_wiz_1"));
     location lWiz2 = GetLocation(GetWaypointByTag("cut10_reset_wiz_2"));
     location lWiz3 = GetLocation(GetWaypointByTag("cut10_reset_wiz_3"));

     // Stops for the runner drow.
     location lRun1 = GetLocation(GetWaypointByTag("wp_cut10_drow_run1"));
     location lRun2 = GetLocation(GetWaypointByTag("wp_cut10_drow_run2"));

     // Battering Ram operator, and the ram.
     object oRamOp = GetObjectByTag("Cut10_Ram_o");
     object oRam = GetObjectByTag("Cut10_Ram");
     // Drow wizards.
     object oWiz1 = GetObjectByTag("cut10_drow_wiz1");
     object oWiz2 = GetObjectByTag("cut10_drow_wiz2");
     object oWiz3 = GetObjectByTag("cut10_drow_wiz3");

     CutSetActiveCutsceneForObject(oRamOp, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oRam, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oWiz1, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oWiz2, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oWiz3, nCutsceneNumber);

      // Locations for the "good guys" and other good guy objects
     location lGood1 = GetLocation(GetWaypointByTag("wp_cut10_good1"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia_f2", lGood1, 0);
     location lGood2 = GetLocation(GetWaypointByTag("wp_cut10_good2"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia", lGood2, 0);
     location lGood3 = GetLocation(GetWaypointByTag("wp_cut10_good3"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia", lGood3, 0);
     location lGood4 = GetLocation(GetWaypointByTag("wp_cut10_good4"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_gwiz", lGood4, 0);
     location lGood5 = GetLocation(GetWaypointByTag("wp_cut10_good5"));
     CutCreateObject( 0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia", lGood5, 0);
     location lGood6 = GetLocation(GetWaypointByTag("wp_cut10_good6"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia_f", lGood6, 0);
     location lGood7 = GetLocation(GetWaypointByTag("wp_cut10_good7"));
     CutCreateObject(0.2, oPC, OBJECT_TYPE_CREATURE, "cut10_militia", lGood7, 0);
     location lGood8 = GetLocation(GetWaypointByTag("wp_cut10_good8"));
     CutCreateObject(0.0, oPC, OBJECT_TYPE_CREATURE, "Cut10_Ram_r", lGood8, 0);

     // Cutscene objects, and locations not spawned in.
     object oCatapult2 = GetObjectByTag("cut10_cat2");
     location lCatapult2_Target = GetLocation(GetWaypointByTag("wp_cut10_cat2_target"));
     object oBallista1 = GetObjectByTag("Cut10_Ballista1");
     object oBallista2 = GetObjectByTag("Cut10_Ballista2");
     object oDoor1 = GetObjectByTag("cut10_door1");
     object oDoor2 = GetObjectByTag("cut10_door2");

     CutSetActiveCutsceneForObject(oCatapult2, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oBallista1, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oBallista2, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oDoor1, nCutsceneNumber);
     CutSetActiveCutsceneForObject(oDoor2, nCutsceneNumber);

     // Store the camera to be recalled after the scene is done.
     // StoreCameraFacing())
     // Start the cutscene.
     CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, 2); // keep and freeze associates

     // Give an intro dialogue
     // CutSpeakString(1.0, oPC, "[Sobrey] We were not ready for what was about to happen...");
     // Start the screen black.  Fade in from that. This is done to give
     // the spawned in NPCs a chance to start attacking each other.

     // Reset the drow wizards.
     AssignCommand(oWiz1, JumpToLocation(lWiz1));
     AssignCommand(oWiz2, JumpToLocation(lWiz2));
     AssignCommand(oWiz3, JumpToLocation(lWiz3));

     BlackScreen(oPC);
     FadeFromBlack(oPC, FADE_SPEED_SLOWEST);
     // Set the initial camera.
     CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 18.0, 50.0,
        CAMERA_TRANSITION_TYPE_SNAP);
     CutSetCamera(5.3, oPC, CAMERA_MODE_TOP_DOWN, 135.0, 15.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

////////////////////////////////////////////////////////////////////////

     // First Drow wiz casts
     CutActionCastFakeSpellAtLocation(7.1, SPELL_INFERNO, oWiz1, lGood1,
        PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectAtLocation(9.3, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIRESTORM,
        lGood1, 0.0);

     CutActionMoveToLocation(10.0, oPC, lStop1, FALSE);
     CutSetCamera(10.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

     // Second Drow wiz casts
     CutActionCastFakeSpellAtLocation(12.1, SPELL_ICE_STORM, oWiz2,
        lGood4, PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectAtLocation(14.4, oPC, DURATION_TYPE_INSTANT, VFX_FNF_ICESTORM,
        lGood4, 0.0);

     // Launch the ballista.  Apply animation to its operator.
     CutSetActiveCutsceneForObject(GetObjectByTag("Cut10_Ballista1_o"),
        nCutsceneNumber);
     CutPlayAnimation(14.0, GetObjectByTag("Cut10_Ballista1_o"),
        ANIMATION_LOOPING_GET_MID, 2.0);
     CutActionCastFakeSpellAtLocation(15.1, SPELL_FIREBALL, oBallista1,
        lStop5, PROJECTILE_PATH_TYPE_HIGH_BALLISTIC);
     // Second Drow wiz casts
     CutActionCastFakeSpellAtLocation(17.0, SPELL_SPELL_RESISTANCE, oWiz2,
        GetLocation(oWiz2),PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectToObject(19.4, DURATION_TYPE_TEMPORARY, VFX_DUR_SPELLTURNING,
        oWiz2, 10.0);


     CutActionMoveToLocation(20.0, oPC, lStop2, FALSE);
     CutSetCamera(21.0, oPC, CAMERA_MODE_TOP_DOWN, 35.0, 17.0, 1.0,
        CAMERA_TRANSITION_TYPE_SLOW);
     // Launch the ballista.  Apply animation to its operator.
     CutPlayAnimation(24.0, GetObjectByTag("Cut10_Ballista1_o"),
        ANIMATION_LOOPING_GET_MID, 2.0);
     CutActionCastFakeSpellAtLocation(25.1, SPELL_FIREBALL, oBallista1,
        lStop5,PROJECTILE_PATH_TYPE_BALLISTIC);
     CutActionMoveToLocation(29.8, oPC, lStop3, TRUE);
     CutSetCamera(31.0, oPC, CAMERA_MODE_TOP_DOWN, 35.0, 17.0, 1.0,
        CAMERA_TRANSITION_TYPE_FAST);
     // Launch the catapult.  Apply animation to its operator.
     CutSetActiveCutsceneForObject(GetObjectByTag("cut10_cat2_o"), nCutsceneNumber);
     CutPlayAnimation(29.0, GetObjectByTag("cut10_cat2_o"),
        ANIMATION_LOOPING_GET_MID, 2.0);
     CutActionCastFakeSpellAtLocation(30.1, SPELL_FIREBALL, oCatapult2,
        lCatapult2_Target,PROJECTILE_PATH_TYPE_BALLISTIC);
     CutApplyEffectAtLocation(31.7, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL,
        lCatapult2_Target, 0.0);
     CutApplyEffectAtLocation(31.8, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE,
        lCatapult2_Target, 0.0);

     // Destroy the statue, barrels, and cart in a chain reaction.

     // statue
     DelayCommand(32.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(100),
        GetObjectByTag("cut10_statue1")));
     // Create a broken statue in place of the old one.
     CutCreateObject(32.5, oPC, OBJECT_TYPE_PLACEABLE,
        "cut10_statue1_b", lStatue1, 0);

     CutApplyEffectAtLocation(33.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE,
        lCatapult2_Target, 0.0);
     // barrel 1
     CutApplyEffectAtLocation(33.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL,
        lBarrel1, 0.0);
     DelayCommand(33.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,
        EffectDamage(100), GetObjectByTag("cut10_barrel1")));
     // Create a broken barrel in place of the old one.
     CutCreateObject(33.1, oPC, OBJECT_TYPE_PLACEABLE,
        "cut10_barrel1_b", lBarrel1, 0);


     CutApplyEffectAtLocation(33.6, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE,
        lCatapult2_Target, 0.0);
     // barrel 2
     CutApplyEffectAtLocation(33.6, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL,
        lBarrel2, 0.0);
     DelayCommand(33.6, ApplyEffectToObject(DURATION_TYPE_INSTANT,
        EffectDamage(100), GetObjectByTag("cut10_barrel2")));
     // Create a broken barrel in place of the old one.
     CutCreateObject(33.7, oPC, OBJECT_TYPE_PLACEABLE, "cut10_flame1", lBarrel2, 0);
     CutCreateObject(33.7, oPC, OBJECT_TYPE_PLACEABLE,
        "cut10_barrel2_b", lBarrel2, 0);

     CutApplyEffectAtLocation(34.2, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE,
        lCatapult2_Target, 0.0);

     // cart
     CutApplyEffectAtLocation(34.2, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL,
        lCart, 0.0);
     DelayCommand(34.2,
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(100),
        GetObjectByTag("cut10_cart")));

     // Create a broken cart in place of the old one.
     CutCreateObject(34.3, oPC, OBJECT_TYPE_PLACEABLE, "cut10_flame2", lCart, 0);
     CutCreateObject(34.3, oPC, OBJECT_TYPE_PLACEABLE, "cut10_cart_b", lCart, 0);

     // Kill the militia near the last exploding barrel.

     DelayCommand(35.4,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,
        EffectVisualEffect(VFX_IMP_FLAME_M), GetObjectByTag("cut10_militia_f")));
     DelayCommand(35.5,
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999),
        GetObjectByTag("cut10_militia_f")));

     CutSetCamera(31.3, oPC, CAMERA_MODE_TOP_DOWN, 15.0, 5.0, 10.0,
        CAMERA_TRANSITION_TYPE_FAST);
     CutSetCamera(32.2, oPC, CAMERA_MODE_TOP_DOWN, 135.0, 6.0, 70.0,
        CAMERA_TRANSITION_TYPE_FAST);
     CutActionMoveToLocation(40.0, oPC, lStop4, FALSE);
     CutSetCamera(41.0, oPC, CAMERA_MODE_TOP_DOWN, 45.0, 15.0, 50.0,
        CAMERA_TRANSITION_TYPE_MEDIUM);

     // First Drow wiz casts
     CutActionCastFakeSpellAtLocation(42.0, SPELL_HORRID_WILTING, oWiz1,
        lGood1,PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectAtLocation(44.7, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_HORRID_WILTING, lGood1, 0.0);

     DelayCommand(45.8,
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999),
        GetObjectByTag("cut10_militia_f2")));
     CutActionCastFakeSpellAtLocation(47.0, SPELL_NATURES_BALANCE, oWiz1,
        lGood1,PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectAtLocation(49.9, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_NATURES_BALANCE, lGood1, 0.0);

     CutActionMoveToLocation(50.0, oPC, lStop5, FALSE);
     CutSetCamera(51.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 9.0, 60.0,
        CAMERA_TRANSITION_TYPE_MEDIUM);

     // Launch the ballista.  Apply animation to its operator.
     DelayCommand(49.5,
        AssignCommand(GetObjectByTag("Cut10_Ballista2_o"),
        PlayAnimation(ANIMATION_LOOPING_GET_MID, 2.0)));

     CutActionCastFakeSpellAtLocation(50.6, SPELL_FIREBALL, oBallista2,
        lStop7,PROJECTILE_PATH_TYPE_BALLISTIC);

     // Third Drow wiz casts, then casts again to open the door.
     CutActionCastFakeSpellAtLocation(50.0, SPELL_BANE, oWiz3,
        lGood8,PROJECTILE_PATH_TYPE_DEFAULT);
     CutApplyEffectAtLocation(52.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_30,
        lGood8, 0.0);
     CutApplyEffectToObject(52.6, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD,
        GetObjectByTag("Cut10_Ram_o"), 20.0);


     CutApplyEffectToObject(52.6, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD,
        GetObjectByTag("Cut10_Ram_o"), 20.0);

     CutActionCastFakeSpellAtObject(56.0, SPELL_KNOCK, oWiz3, oDoor1,
        PROJECTILE_PATH_TYPE_DEFAULT);
     // Create a drow near the door, who will run in after it is opened.
     CutCreateObject(55.1, oPC, OBJECT_TYPE_CREATURE, "cut10_drow_run", lBad10, 0);
     CutApplyEffectToObject(58.5, DURATION_TYPE_INSTANT, VFX_IMP_KNOCK, oDoor1, 10.0);

     CutActionOpenDoor(59.2, oDoor1, oDoor1);

     DelayCommand(56.0,
        AssignCommand(GetObjectByTag("cut10_drow_run"),
        ActionMoveToLocation(lRun1, TRUE)));

     CutActionMoveToLocation(60.0, oPC, lStop6, TRUE);

     DelayCommand(60.0,
        AssignCommand(GetObjectByTag("cut10_drow_run"),
        ActionMoveToLocation(lRun2, TRUE)));

     CutSetCamera(64.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.0, 70.0,
        CAMERA_TRANSITION_TYPE_SLOW);

     CutActionOpenDoor(68.7, oDoor2, oDoor2);
     CutCreateObject(69.1, oPC, OBJECT_TYPE_CREATURE, "cut10_duer_end1", lBad8, 0);
     CutCreateObject(70.1, oPC, OBJECT_TYPE_CREATURE, "cut10_duer_end2", lBad9, 0);
     CutActionMoveToLocation(68.0, oPC, lStop7, FALSE);
     CutSetCamera(70.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.9, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);
     //CutPlayAnimation(69.5, GetObjectByTag("cut10_duer_end2"), ANIMATION_FIREFORGET_VICTORY1,
     //                 2.0);

     DelayCommand(72.8,
        AssignCommand(GetObjectByTag("cut10_duer_end2"),
        ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2, 0.0)));
     DelayCommand(73.0,
        AssignCommand(GetObjectByTag("cut10_duer_end2"),
        SpeakStringByStrRef(83947)));

    // Stop the cutscene.
    CutFadeOutAndIn(77.2, oPC);

    // Teleport the PC back to the magic shoppe
    CutJumpToLocation(80.7, oPC, GetLocation(GetWaypointByTag("wp_cut10_telescope")));

    CutDisableCutscene(nCutsceneNumber, 81.0, 81.0, RESTORE_TYPE_NONE);

    // Reset the telescope.
    DelayCommand(81.0, SetTelescope(oPC));
    //DelayCommand(80.8, RestoreCameraFacing());
}

// Reset the telescope
void SetTelescope(object oPC)
{
    if(GetLocalInt(GetModule(),
        "nCut" + IntToString(GetLocalInt(oPC, "nCutsceneNumber")) + "Skipped") != 1)
            //SetLocalInt(GetModule(), "nUniTelescopeUsed", 0);
        SetLocalInt(oPC, "X2_SawUnivesityBattle",
        GetLocalInt(oPC, "X2_SawUnivesityBattle") + 1);
}

