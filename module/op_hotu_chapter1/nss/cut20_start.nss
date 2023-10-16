//::///////////////////////////////////////////////
//:: Name: cut20_start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opening cutscene script for the main PC -
    teleport any new PCs to the players room in
    the Yawning Portal
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void StartCutscene(object oPC);
void MultiJump(object oPC, string sWay);
void DrawSpider(int nCutscene, object oPC, int iBeam, float fDur);
void PlayMusic(int nCutscene, object oPC);
void SetShift(int nCutscene, object oPC, float fShift);
void CutSound(int nCutscene, object oSound);

int nCutsceneNumber = 20;

void main()
{
    //Get the entering object
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC))
    {
        return;
    }

    if(!GetLocalInt(OBJECT_SELF, "bSetGlobalsJE"))
    {
        SetLocalInt(OBJECT_SELF, "bSetGlobalsJE", TRUE);
        //SETTING GLOBAL VARIABLES HERE - THIS AREA SHOULD ONLY BE LOADED BEFORE
        //THE TWO FIGHT SCENES - SO THESE VARIABLES SHOULD NOT BE RESET BY A SAVE AND LOAD

        //WATERDEEP BATTLE VARIABLES
        //Count of enemies
        SetLocalInt(GetModule(), "nQ2A1NumCreatures", 13);

        //VARIABLES FOR YAWNING PORTAL ATTACK
        //timer
        SetLocalInt(GetModule(), "X2_ncut1mobcount", 7);//Number of enemies spawning in for Cutscene 5 attack on the main floor
        SetLocalInt(GetModule(), "X2_wellmobcount", 12);//Number of enemies spawning in for Cutscene 5 attack in the well room

        //UNDERMOUNTAIN LEVEL 2
        //Chains on level 2 - for journal entry
        SetLocalInt(GetModule(), "nChainPuzzle", 1);

        //Assign a PC Number to each entering PC so that we know
        //who player 1 is - the PC who should be getting the dream
        //sequences.
        SetLocalInt(GetModule(), "nPCNumber", 1);
    }


    // *********************
    // * If character is less than level 12
    // * jump them to the bedtime scene.
    // * Brent
    // *********************
    if (GetHitDice(oPC) < 12)
    {
        AssignCommand(oPC, JumpToObject(GetObjectByTag("ALT_START_LOC")));
        SetLocalInt(GetModule(), "X2_G_LOWLEVELSTART", 10);
       // AssignCommand(oPC, ExecuteScript("bk_levelup", oPC));
       //AssignCommand(oPC, ActionStartConversation(oPC, "bk_levelup"));
        return;
    }



    //Set the entering object's PC number
    SetLocalInt(oPC, "nPCNumber", GetLocalInt(GetModule(), "nPCNumber"));
    //Increment the module's PC count
    SetLocalInt(GetModule(), "nPCNumber", GetLocalInt(GetModule(), "nPCNumber") + 1);


    //if oPC is Player 1 - the cutscene will proceed,
    //if the entering PC is not Player 1 - jump them to the inn room to wait for
    //Player 1 to finish the cutscene
    if (GetLocalInt(oPC, "nPCNumber") > 1)
    {
        StopFade(oPC);
        AssignCommand(oPC, MultiJump(oPC, "q2a_enter_playerx"));
    }
    //else this is Player 1 so run the cutscene
    else
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_RUN_CUT_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_RUN_CUT_ONCE", 1);

        CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);

        //Set a variable on the PC so that we know to spawn in the assassin when
        //they return to the yawning portal
        SetLocalInt(oPC, "X2_Q2ASpawnTheAssassin", 1);

        // Store the camera to be recalled after the scene is done.
        // StoreCameraFacing();


        //Set Hero Token for conversations
        SetCustomToken(2104, GetName(oPC));
        DelayCommand(1.0, StartCutscene(oPC));
        BlackScreen(oPC);
    }
}

// If this isn't the first PC, jump to the YP rooms
void MultiJump(object oPC, string sWay)
{
    SetCommandable(TRUE, oPC);
    ActionJumpToObject(GetWaypointByTag(sWay));
}

void StartCutscene(object oPC)
{

    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutSetAbortDelay(nCutsceneNumber, 2.0);
    CutSetDestroyCopyDelay(nCutsceneNumber, 2.0);
    // Get the racial type and gender of the PC so the intro
    // dialogue can reflect this.
    int nDialog ;
    if(GetRacialType(oPC) == RACIAL_TYPE_ELF)
       //ialogue = "What is this?! A darthiir? One of our vile surface cousins? Have your spells become faulty, fool?";
       nDialog = 83962;
    else {
       if(GetGender(oPC) == GENDER_MALE)
          //ialogue = "What is this?! A surfacer? And a male, no less? Have your spells become faulty, fool?";
        nDialog = 83963;
       else if(GetGender(oPC) == GENDER_FEMALE)
          //ialogue = "What is this?! A surfacer female? Have your spells become faulty, fool?";
        nDialog = 83964;
       else
       // sDialogue = "What is this?! A surfacer? Have your spells become faulty, fool?";
        nDialog = 83965;
        }

    // Cutscene actors and objects.
    object oMatron = GetObjectByTag("cut20_jyslin");
    object oWiz1 = GetObjectByTag("cut20_wiz1");
    // Set the first wizard so his corpse won't fade.
    AssignCommand(oWiz1, SetIsDestroyable(FALSE, FALSE, FALSE));

    object oWiz2 = GetObjectByTag("cut20_wiz2");
    object oWiz3 = GetObjectByTag("cut20_wiz3");
    object oWiz4 = GetObjectByTag("cut20_wiz4");
    object oWiz5 = GetObjectByTag("cut20_wiz5");
    object oWiz6 = GetObjectByTag("cut20_wiz6");
    object oWiz7 = GetObjectByTag("cut20_wiz7");

    object oMaiden1 = GetObjectByTag("cut20_maiden1");
    object oMaiden2 = GetObjectByTag("cut20_maiden2");
    object oMaiden3 = GetObjectByTag("cut20_maiden3");
    object oMaiden4 = GetObjectByTag("cut20_maiden4");
    object oMaiden5 = GetObjectByTag("cut20_maiden5");
    object oMaiden6 = GetObjectByTag("cut20_maiden6");
    object oMaiden7 = GetObjectByTag("cut20_maiden7");
    object oMaiden8 = GetObjectByTag("cut20_maiden8");

    object oDrider1 = GetObjectByTag("cut20_drider1");
    object oDrider2 = GetObjectByTag("cut20_drider2");

    object oWizTarget = GetObjectByTag("cut20_wiz_target");
    object oCircle = GetObjectByTag("cut20_circle");
    object oCircle2 = GetObjectByTag("cut20_circle2");

    object oSound = GetObjectByTag("cut20_summ_sfx");
    CutSetActiveCutsceneForObject(oSound, nCutsceneNumber);
    object oSound2 = GetObjectByTag("cut20_death_sfx");
    CutSetActiveCutsceneForObject(oSound2, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oCircle, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oCircle2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMatron, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz5, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz6, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWiz7, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden5, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden6, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden7, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMaiden8, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrider1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrider2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWizTarget, nCutsceneNumber);

    // The PC copy
    location lLoc = GetLocation(GetWaypointByTag("wp_cut20_pccopy_start"));
    object oCopy = CutCreatePCCopy(oPC, lLoc, "PreludePCCopy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutApplyEffectToObject2(77.0, DURATION_TYPE_PERMANENT, EffectParalyze(), oCopy);
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oCopy);
    if (oHelmet != OBJECT_INVALID)
    {
        DestroyObject(oHelmet);
    }

    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, FALSE, 2);
    // Cutscene waypoint locations
    location lMatron1 = GetLocation(GetWaypointByTag("wp_cut20_matron1"));
    location lMatron2 = GetLocation(GetWaypointByTag("wp_cut20_matron2"));
    location lMatron3 = GetLocation(GetWaypointByTag("wp_cut20_matron3"));
    location lStop1 = GetLocation(GetWaypointByTag("wp_cut20_stop1"));
    location lWizStop1 = GetLocation(GetWaypointByTag("wp_cut20_wiz1_stop1"));
    location lWizStop2 = GetLocation(GetWaypointByTag("wp_cut20_wiz1_stop2"));
    location lWizStop3 = GetLocation(GetWaypointByTag("wp_cut20_wiz1_stop3"));
    location lWizStop4 = GetLocation(GetWaypointByTag("wp_cut20_wiz1_stop4"));

    SetLocalFloat(GetArea(oPC), "cut_shift", 0.0);
    DelayCommand(57.0, SetShift(nCutsceneNumber, oPC, 20.0));
    // Start the cutscene.
    CutJumpToLocation(0.0, oPC, GetLocation(GetObjectByTag("PLACESTARTHERE")));
    // Set the initial camera.
    DelayCommand(1.5, FadeFromBlack(oPC));
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 10.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);


/////////////////////////////////////////////////////////////////

    // All Shifts - Anything that is being inserted after the shift.
    // Only the new inserted stuff.  Everything else will be shifted
    // automatically. Everything here should pass FALSE at the end.
    ////////////////////////////////////////////////////////////////

    CutSetCamera(56.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 9.0, 40.0, CAMERA_TRANSITION_TYPE_SLOW, FALSE);
    CutSetCamera(65.3, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 12.0, 60.0, CAMERA_TRANSITION_TYPE_SLOW, FALSE);
    // Start the bowing
    CutPlayAnimation(57.4, oWiz2, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    CutPlayAnimation(57.8, oWiz3, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    CutPlayAnimation(57.9, oWiz4, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    CutPlayAnimation(58.4, oWiz5, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    CutPlayAnimation(57.8, oWiz6, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    CutPlayAnimation(58.4, oWiz7, ANIMATION_LOOPING_WORSHIP, 20.0, FALSE);
    // Move wiz to center
    CutActionMoveToLocation(58.0, oWiz1, GetLocation(GetWaypointByTag("wp_cut20_pccopy3")), FALSE, FALSE);
    CutSetFacingPoint(59.5, oWiz1, "cut20_wiz6", FALSE);
    // Have the main wizard cast
    CutPlayAnimation(59.9, oCircle, ANIMATION_PLACEABLE_ACTIVATE, 5.0, FALSE);
    CutActionCastFakeSpellAtObject(60.8, SPELL_FIRE_STORM, oWiz1, oWiz1, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
    CutApplyEffectToObject(62.5, DURATION_TYPE_INSTANT, VFX_FNF_SUNBEAM, oWiz1, 20.0, FALSE);
    CutApplyEffectToObject(63.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz1, 20.0, FALSE);
    CutApplyEffectToObject(64.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz1, 12.0, FALSE);
    CutPlayAnimation(64.5, oWiz1, ANIMATION_LOOPING_WORSHIP, 13.0, FALSE);
    // The other wizards react
    CutApplyEffectToObject(64.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz4, 20.0, FALSE);
    CutApplyEffectToObject(65.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz4, 40.0, FALSE);
    CutApplyEffectToObject(66.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz4, 13.0, FALSE);

    CutApplyEffectToObject(66.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz6, 20.0, FALSE);
    CutApplyEffectToObject(67.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz6, 38.0, FALSE);
    CutApplyEffectToObject(68.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz6, 11.0, FALSE);

    CutApplyEffectToObject(68.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz2, 20.0, FALSE);
    CutApplyEffectToObject(69.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz2, 36.0, FALSE);
    CutApplyEffectToObject(70.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz2, 9.0, FALSE);

    CutApplyEffectToObject(70.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz5, 20.0, FALSE);
    CutApplyEffectToObject(71.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz5, 32.0, FALSE);
    CutApplyEffectToObject(72.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz5, 7.0, FALSE);

    CutApplyEffectToObject(72.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz3, 20.0, FALSE);
    CutApplyEffectToObject(73.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz3, 30.0, FALSE);
    CutApplyEffectToObject(74.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz3, 5.0, FALSE);

    CutApplyEffectToObject(74.5, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE, oWiz7, 20.0, FALSE);
    CutApplyEffectToObject(75.5, DURATION_TYPE_TEMPORARY, VFX_IMP_ELEMENTAL_PROTECTION, oWiz7, 20.0, FALSE);
    CutApplyEffectToObject(76.3, DURATION_TYPE_TEMPORARY, VFX_DUR_ELEMENTAL_SHIELD, oWiz7, 3.0, FALSE);

    CutApplyEffectAtLocation(82.8, oPC, DURATION_TYPE_TEMPORARY, VFX_DUR_WEB_MASS, GetLocation(GetWaypointByTag("wp_cut20_pccopy3")), 20.0, FALSE);

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////

    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 11.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(7.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 5.0, 65.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    //
    CutSetCamera(8.0, oPC, CAMERA_MODE_TOP_DOWN, 210.0, 0.1, 80.0,
                 CAMERA_TRANSITION_TYPE_VERY_FAST);

    CutSetCamera(11.5, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 4.0, 82.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(15.6, oPC, CAMERA_MODE_TOP_DOWN, 210.0, 0.1, 80.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(26.5, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 4.0, 82.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(29.4, oPC, CAMERA_MODE_TOP_DOWN, 210.0, 0.1, 80.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(37.0, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 4.0, 82.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(41.1, oPC, CAMERA_MODE_TOP_DOWN, 210.0, 0.1, 80.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(55.3, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 4.0, 82.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    //CutSetCamera(47.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 1.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);

    //

    //CutSetCamera(25.5, oPC, CAMERA_MODE_TOP_DOWN, 105.0, 4.0, 75.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);

    //CutSetCamera(38.1, oPC, CAMERA_MODE_TOP_DOWN, 160.0, 5.0, 68.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);

    CutSetCamera(57.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 1.0,
                 CAMERA_TRANSITION_TYPE_FAST);

    CutSetCamera(68.8, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 7.0, 60.0,
                 CAMERA_TRANSITION_TYPE_FAST);
    CutSetCamera(77.0, oPC, CAMERA_MODE_TOP_DOWN, 60.0, 4.5, 70.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(94.5, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 6.0, 60.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(100.1, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 3.5, 65.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(107.3, oPC, CAMERA_MODE_TOP_DOWN, 250.0, 8.0, 65.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCamera(116.0, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 7.0, 65.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(121.2, oPC, CAMERA_MODE_TOP_DOWN, 280.0, 7.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(125.0, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 1.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    CutActionMoveToLocation(1.5, oMatron, lMatron1, FALSE);
    CutSetFacingPoint(5.6, oMatron, "cut20_wiz1");
    CutSetFacingPoint(6.0, oWiz1, "cut20_jyslin");
  CutActionMoveToLocation(72.0, oWiz1, lWizStop1, FALSE, FALSE);
  CutSetFacingPoint(81.5, oWiz1, "cut20_wiz4", FALSE);
    CutActionMoveToLocation(77.5, oMatron, lMatron2, FALSE);
    CutSetFacingPoint(78.7, oMatron, "cut20_wiz7");
    CutSetFacingPoint(79.5, oMatron, "cut20_wiz7");
    CutSetFacingPoint(79.9, oMatron, "cut20_wiz7");
    CutActionMoveToLocation(80.0, oWiz1, lWizStop2, FALSE);
    CutSetFacingPoint(82.0, oMatron, "cut20_wiz7");
    CutSetFacingPoint(83.9, oWiz1, "cut20_jyslin");
    CutSetFacingPoint(87.9, oMatron, "cut20_wiz1");
    CutSetFacingPoint(106.9, oMatron, "cut20_wiz3");
    CutActionMoveToLocation(113.5, oWiz3, lWizStop3, FALSE);
    CutSetFacingPoint(118.5, oMatron, "cut20_wiz7");
    CutActionMoveToLocation(120.0, oWiz3, lWizStop4, FALSE);
    CutSetFacingPoint(121.5, oMatron, "cut20_wiz7");
    CutSetFacingPoint(122.5, oMatron, "cut20_wiz7");

    // Dialogue
    ///////////

    CutSpeakStringByStrRef(9.0, oMatron, 83948);

    //CutSpeakString(11.5, oMatron, "");
    CutSpeakStringByStrRef(11.6, oWiz1, 83949);

    //CutSpeakString(15.6, oWiz1, "");
    CutSpeakStringByStrRef(15.7, oMatron, 83950);

    //CutSpeakString(26.5, oMatron, "");
    CutSpeakStringByStrRef(26.6, oWiz1, 83951);

    //CutSpeakString(29.4, oWiz1, "");
    CutSpeakStringByStrRef(29.5, oMatron, 83952);

    //CutSpeakString(37.0, oMatron, "");
    CutSpeakStringByStrRef(37.1, oWiz1, 83953);


    CutSpeakStringByStrRef(41.2, oMatron, 83954);
    CutSpeakStringByStrRef(55.4, oMatron, 83955);

    CutSpeakStringByStrRef(80.0, oMatron, nDialog);
    CutSpeakStringByStrRef(89.5, oWiz1, 83956);
    //CutSpeakString(92.1, oWiz1, "");
    CutSpeakStringByStrRef(95.5, oMatron, 83957);
    CutSpeakStringByStrRef(100.2, oMatron, 83958 );
    CutSpeakStringByStrRef(107.0, oMatron, 83959);
    CutSpeakStringByStrRef(114.0, oWiz3, 83960);
    CutSpeakStringByStrRef(124.0, oMatron, 83961);

    // Spell effects (real or fake castings).
    /////////////////////////////////////////

    // Have the wizards cast
    CutActionCastFakeSpellAtObject(60.8, SPELL_FLAME_STRIKE, oWiz2, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(63.0, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz2, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 4.9);
    //DelayCommand(63.0, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz2, BODY_NODE_CHEST, FALSE), oWizTarget, 4.9)));

    CutActionCastFakeSpellAtObject(60.7, SPELL_FLAME_STRIKE, oWiz3, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(62.6, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_FIRE, oWiz3, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 4.9);
    //DelayCommand(62.6, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz3, BODY_NODE_CHEST, FALSE), oWizTarget, 4.9)));

    CutActionCastFakeSpellAtObject(61.5, SPELL_FLAME_STRIKE, oWiz4, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(62.6, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz4, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 4.5);
    //DelayCommand(62.8, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz4, BODY_NODE_CHEST, FALSE), oWizTarget, 4.5)));

    CutActionCastFakeSpellAtObject(60.6, SPELL_FLAME_STRIKE, oWiz5, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(63.0, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_FIRE, oWiz5, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 4.5);
    //DelayCommand(63.0, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz5, BODY_NODE_CHEST, FALSE), oWizTarget, 4.5)));

    CutActionCastFakeSpellAtObject(60.8, SPELL_FLAME_STRIKE, oWiz6, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(63.2, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz6, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 4.2);
    //DelayCommand(63.2, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz6, BODY_NODE_CHEST, FALSE), oWizTarget, 4.2)));

    CutActionCastFakeSpellAtObject(60.9, SPELL_FLAME_STRIKE, oWiz7, oWizTarget, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(63.4, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_FIRE, oWiz7, BODY_NODE_CHEST, FALSE),
                           oWizTarget, 3.0);
    //DelayCommand(63.4, DelayCommand(GetShift(oPC, TRUE), ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE, oWiz7, BODY_NODE_CHEST, FALSE), oWizTarget, 3.0)));

    // Collective wizard effect.
    CutApplyEffectAtLocation(64.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIRESTORM,
                             GetLocation(GetWaypointByTag("wp_cut20_pccopy")), 10.0);

    CutApplyEffectAtLocation(66.2, oPC, DURATION_TYPE_INSTANT, VFX_IMP_DIVINE_STRIKE_FIRE,
                             GetLocation(GetWaypointByTag("wp_cut20_pccopy")), 10.0);
    CutApplyEffectAtLocation(66.4, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE,
                             GetLocation(GetWaypointByTag("wp_cut20_pccopy")), 10.0);

    // Effects for when the PC is shown.
    DelayCommand(90.9, CutSound(nCutsceneNumber, oSound));
    CutApplyEffectAtLocation(71.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_GATE,
                             GetLocation(GetWaypointByTag("wp_cut20_pccopy")), 10.0);
    CutApplyEffectToObject(77.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(85.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(93.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(101.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(109.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(117.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(125.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);
    CutApplyEffectToObject(133.0, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE,
                           oCopy, 500.0);


    // The Matron Mother will kill the first wizard.
    CutActionCastFakeSpellAtObject(93.0, SPELL_FINGER_OF_DEATH, oMatron, oWiz1, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject(95.2, DURATION_TYPE_INSTANT, VFX_IMP_HARM, oWiz1, 4.2);
    CutApplyEffectToObject(95.3, DURATION_TYPE_INSTANT, VFX_IMP_DEATH_L, oWiz1, 4.2);
    //DelayCommand(115.7, CutSound(nCutsceneNumber, oSound2));
    CutPlaySound(95.6, oPC, "vs_faldom_dead");
    CutDeath(95.7, oWiz1, FALSE);

    // Have the lesser wiz clean up the dead one.
    CutActionCastFakeSpellAtObject(116.5, SPELL_WEIRD, oWiz3, oWiz1, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject(119.2, DURATION_TYPE_INSTANT, VFX_IMP_RAISE_DEAD, oWiz1, 4.2);
    CutApplyEffectToObject(119.2, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_20, oWiz1, 4.2);
    DelayCommand(119.3, DelayCommand(GetShift(oPC, TRUE), AssignCommand(oWiz1, SetIsDestroyable(TRUE, TRUE, TRUE))));
    DelayCommand(121.1, DelayCommand(GetShift(oPC, TRUE), DestroyObject(oWiz1)));
    CutDestroyObject(125.0, oWiz3);

    // Make the PC copy transparent.
    CutApplyEffectToObject(2.0, DURATION_TYPE_PERMANENT, VFX_DUR_INVISIBILITY, oCopy, 9999.0);
    CutApplyEffectToObject(3.0, DURATION_TYPE_PERMANENT, VFX_DUR_PROT_PREMONITION, oCopy, 9999.0);
    CutApplyEffectToObject(4.0, DURATION_TYPE_PERMANENT, VFX_DUR_SPELLTURNING, oCopy, 9999.0);

    // The Matron Mother will destroy the image of the PC.
    CutActionCastFakeSpellAtObject(138.5, SPELL_POWER_WORD_STUN, oMatron, oCopy, PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject(140.8, DURATION_TYPE_TEMPORARY, VFX_DUR_WEB_MASS, oCopy, 10.2);
    CutApplyEffectToObject(141.4, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_MONSTER_1, oCopy, 4.2);
    CutApplyEffectToObject(140.5, DURATION_TYPE_INSTANT, VFX_FNF_SOUND_BURST, oCopy, 4.2);
    // Make the copy of the PC disappear.
    CutJumpToLocation(142.9, oCopy, GetLocation(GetWaypointByTag("wp_cut20_pccopy_start")));


    // Animations
    /////////////

    // Talking animations
    CutPlayAnimation(8.9, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 2.5);
    CutPlayAnimation(11.5, oWiz1, ANIMATION_LOOPING_TALK_NORMAL, 4.0);
    CutPlayAnimation(15.6, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 11.0);
    CutPlayAnimation(26.5, oWiz1, ANIMATION_LOOPING_TALK_PLEADING, 3.0);
    CutPlayAnimation(29.4, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 8.0);
    CutPlayAnimation(37.0, oWiz1, ANIMATION_LOOPING_TALK_NORMAL, 4.0);
    CutPlayAnimation(41.1, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 14.0);
    CutPlayAnimation(55.3, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 4.0);

    CutPlayAnimation(79.9, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 8.0);
    CutPlayAnimation(88.4, oWiz1, ANIMATION_LOOPING_TALK_NORMAL, 4.0);
    CutPlayAnimation(112.8, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 5.0);
    CutPlayAnimation(123.9, oMatron, ANIMATION_LOOPING_TALK_NORMAL, 5.0);

    // Have the wizards bow.
    CutPlayAnimation(7.2, oWiz1, ANIMATION_FIREFORGET_BOW, 3.0);
    CutPlayAnimation(55.2, oWiz1, ANIMATION_FIREFORGET_BOW, 3.0);
    CutPlayAnimation(113.0, oWiz3, ANIMATION_FIREFORGET_BOW, 3.0);

    // Have the handmaidens start worshipping.
    CutPlayAnimation(57.2, oMaiden1, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(57.6, oMaiden2, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(59.2, oMaiden8, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(62.0, oMaiden4, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(63.0, oMaiden7, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(63.9, oMaiden6, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(64.2, oMaiden5, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    CutPlayAnimation(65.5, oMaiden3, ANIMATION_LOOPING_WORSHIP, 40.0, FALSE);
    // Have the handmaidens start worshipping a second time.
    CutPlayAnimation(99.0, oMaiden1, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(99.2, oMaiden2, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(99.4, oMaiden8, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(99.6, oMaiden4, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(99.8, oMaiden7, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(100.0, oMaiden6, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(100.2, oMaiden5, ANIMATION_LOOPING_WORSHIP, 40.0);
    CutPlayAnimation(100.5, oMaiden3, ANIMATION_LOOPING_WORSHIP, 40.0);

    // Misc
    ////////

    // Draw the spider with the beams.
    CutDestroyObject(61.0, oCircle);
    DelayCommand(67.4, DelayCommand(GetShift(oPC, TRUE), DrawSpider(nCutsceneNumber, oPC, 482, 9.0)));
    // Make the copy of the PC appear.
    CutJumpToLocation(75.2, oCopy, GetLocation(GetWaypointByTag("wp_cut20_pccopy")));
    CutPlayAnimation(77.0, oCircle2, ANIMATION_PLACEABLE_ACTIVATE, 5.0);
    // Start the background music.
    CutSetMusic(77.8, oPC, 66);

    // Fade the scene
    CutFadeToBlack(141.1, oPC);
    // End the cutscene
    CutJumpToLocation(142.9, oPC, GetLocation(GetWaypointByTag("q2a_enter_player1")));
    CutFadeFromBlack(143.2, oPC);
    CutDisableCutscene(nCutsceneNumber, 164.3, 164.3);
    // DelayCommand(137.3, RestoreCameraFacing());
}

//  This script draws a spider on the ground, made
//  from beams. This is for the opening cutscene
//  and done just for flavor.
void DrawSpider(int nCutscene, object oPC, int iBeam, float fDur)
{
   if(CutGetActiveCutsceneForObject(oPC) == nCutscene)
   {
     object oPillar1 = GetObjectByTag("pillar1");
     object oPillar2 = GetObjectByTag("pillar2");
     object oPillar3 = GetObjectByTag("pillar3");
     object oPillar4 = GetObjectByTag("pillar4");
     object oPillar5 = GetObjectByTag("pillar5");
     object oPillar6 = GetObjectByTag("pillar6");
     object oPillar7 = GetObjectByTag("pillar7");
     object oPillar8 = GetObjectByTag("pillar8");
     object oPillar9 = GetObjectByTag("pillar9");
     object oPillar10 = GetObjectByTag("pillar10");
     object oPillar11 = GetObjectByTag("pillar11");
     object oPillar12 = GetObjectByTag("pillar12");
     object oPillar13 = GetObjectByTag("pillar13");
     object oPillar14 = GetObjectByTag("pillar14");
     object oPillar15 = GetObjectByTag("pillar15");
     object oPillar16 = GetObjectByTag("pillar16");
     object oPillar17 = GetObjectByTag("pillar17");
     object oPillar18 = GetObjectByTag("pillar18");
     object oPillar19 = GetObjectByTag("pillar19");
     object oPillar20 = GetObjectByTag("pillar20");
     object oPillar21 = GetObjectByTag("pillar21");
     object oPillar22 = GetObjectByTag("pillar22");
     object oPillar23 = GetObjectByTag("pillar23");
     object oPillar24 = GetObjectByTag("pillar24");
     object oPillar25 = GetObjectByTag("pillar25");
     object oPillar26 = GetObjectByTag("pillar26");
     object oPillar27 = GetObjectByTag("pillar27");
     object oPillar28 = GetObjectByTag("pillar28");
     object oPillar29 = GetObjectByTag("pillar29");
     object oPillar30 = GetObjectByTag("pillar30");
     object oPillar31 = GetObjectByTag("pillar31");
     object oPillar32 = GetObjectByTag("pillar32");
     object oPillar33 = GetObjectByTag("pillar33");
     object oPillar34 = GetObjectByTag("pillar34");

     int iBeam2 = 483;


     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar4, BODY_NODE_CHEST, FALSE), oPillar3, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar3, BODY_NODE_CHEST, FALSE), oPillar5, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar5, BODY_NODE_CHEST, FALSE), oPillar6, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar6, BODY_NODE_CHEST, FALSE), oPillar7, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar7, BODY_NODE_CHEST, FALSE), oPillar8, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar8, BODY_NODE_CHEST, FALSE), oPillar9, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar9, BODY_NODE_CHEST, FALSE), oPillar10, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar10, BODY_NODE_CHEST, FALSE), oPillar11, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar11, BODY_NODE_CHEST, FALSE), oPillar12, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar11, BODY_NODE_CHEST, FALSE), oPillar4, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar4, BODY_NODE_CHEST, FALSE), oPillar16, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar16, BODY_NODE_CHEST, FALSE), oPillar13, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar3, BODY_NODE_CHEST, FALSE), oPillar15, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar15, BODY_NODE_CHEST, FALSE), oPillar14, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar32, BODY_NODE_CHEST, FALSE), oPillar27, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar27, BODY_NODE_CHEST, FALSE), oPillar28, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar32, BODY_NODE_CHEST, FALSE), oPillar25, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar25, BODY_NODE_CHEST, FALSE), oPillar26, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar5, BODY_NODE_CHEST, FALSE), oPillar23, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar23, BODY_NODE_CHEST, FALSE), oPillar24, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar11, BODY_NODE_CHEST, FALSE), oPillar21, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam2, oPillar21, BODY_NODE_CHEST, FALSE), oPillar22, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar29, BODY_NODE_CHEST, FALSE), oPillar19, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar19, BODY_NODE_CHEST, FALSE), oPillar20, fDur);

     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar29, BODY_NODE_CHEST, FALSE), oPillar17, fDur);
     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(iBeam, oPillar17, BODY_NODE_CHEST, FALSE), oPillar18, fDur);
    }
}

// Sets the shift time.
void SetShift(int nCutscene, object oPC, float fShift) {
    if(CutGetActiveCutsceneForObject(oPC) == nCutscene)
      SetLocalFloat(GetArea(oPC), "cut_shift", fShift);
}

void CutSound(int nCutscene, object oSound)
{
    if(CutGetActiveCutsceneForObject(oSound) == nCutscene)
    {
        SoundObjectPlay(oSound);
    }
}
