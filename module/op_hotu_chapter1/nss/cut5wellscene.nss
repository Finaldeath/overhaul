//::///////////////////////////////////////////////
//:: Name: cut5wellscene
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Execute the events for the cutscene in the well
    room that occurs after the Pc has talked with
    Tamsil and Mhaere in the main room
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith warner
//:: Edited By: Brad Prince Sept 16, 2003
//:: Content Edited: Change how scene flows, adjusted
//::                 positioning, cameras, etc.
//:: Created On:  Jan 21/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

int nCutsceneNumber = 52;

void main()
{

    //Get rid of Tamsil upstairs
    object oTamsil = GetObjectByTag("Tamsil1");
    object oDoor = GetObjectByTag("q2a_yp_int");
    //Set well to be open
    SetLocalInt(GetModule(), "NW_WELLROOMOPEN", 10);

    //Tamsil's actions
    AssignCommand(oTamsil, ActionMoveToObject(oDoor, TRUE));
    AssignCommand(oTamsil, SetIsDestroyable(TRUE));
    DestroyObject(oTamsil, 4.0);

    //variable for Durnan's conversation
    SetLocalInt(GetModule(), "DurnanSpoke", 3);

    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);

    int nPCNumber;
    location lTarget2 = GetLocation(GetWaypointByTag("wp_cut5bwell_x2"));
    object oWell = GetObjectByTag("q2a_wellplaceholder");
    //Move all the downstairs people into position
    object oDurnan = GetObjectByTag("q2adurnan");
    object oTomi = GetObjectByTag("pre_tomi");
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oSharwyn = GetObjectByTag("pre_sharwyn");
    object oBeholder = GetObjectByTag("cut52beholder");
    SetImmortal(oBeholder, TRUE);

    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oDurnan);
    BlackScreen(oPC);

//    object oRealWell = GetObjectByTag("q2awell");
//    DestroyObject(oRealWell);
//    object oVfxWell = GetObjectByTag("q2a_wellplaceholder");

    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(358), oVfxWell);

    FadeFromBlack(oPC, FADE_SPEED_SLOW);

    AssignCommand(oDurnan, ActionForceMoveToObject(GetWaypointByTag("wp_cut5bwell_durnan")));
    AssignCommand(oTomi, ActionForceMoveToObject(GetWaypointByTag("wp_cut5bwell_brit")));
    AssignCommand(oLinu, ActionForceMoveToObject(GetWaypointByTag("wp_cut5bwell_jera")));
    AssignCommand(oSharwyn, ActionForceMoveToObject(GetWaypointByTag("wp_cut5bwell_tethlan")));
    AssignCommand(oDaelan, ActionForceMoveToObject(GetWaypointByTag("wp_cut5bwell_durst")));

    CutSetActiveCutsceneForObject(oWell, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDurnan, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oTomi, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oLinu, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oSharwyn, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDaelan, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBeholder, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oWell, nCutsceneNumber);

    //Now the players all need to fade to black and turn invisible and jump downstairs to the well room
    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oPlayers, nCutsceneNumber);
        CutSetCutsceneMode(1.0, oPlayers, TRUE, FALSE, TRUE, FALSE, FALSE);
        //Display Text message for PCs
        //fade the pc to black and back in (in 4 seconds)
        //CutFadeOutAndIn(2.0, oPlayers);

        //GetPCNumber and jump the PC upstairs
        nPCNumber = GetLocalInt(oPlayers, "nPCNumber");


        //Turn PC invisible
        //CutApplyEffectToObject(6.5, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
        //                   oPlayers, 9999.0);
        //check to see if PC has a henchman
        //if (GetHenchman(oPlayers) != OBJECT_INVALID)
        //    CutApplyEffectToObject(6.5, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
        //                   GetHenchman(oPlayers), 9999.0);
        //First five PCs have their own waypoint...
        if (nPCNumber < 6)
        {
            DelayCommand(1.75, AssignCommand(oPlayers, ActionMoveToObject(GetWaypointByTag("wp_cut5bwell_pc" + IntToString(nPCNumber)))));
        }
        else
        {
            DelayCommand(1.75, AssignCommand(oPlayers, ActionJumpToObject(GetWaypointByTag("wp_cut5bwell_pcx"))));
        }
        //DelayCommand(6.0, BlackScreen(oPlayers));
        //DelayCommand(6.5, FadeFromBlack(oPlayers));
        oPlayers = GetNextPC();
    }

    //Change the Music
    object oArea = GetObjectByTag("q2awellroom");
    DelayCommand(14.0, MusicBattleChange(oArea, TRACK_BATTLE_CITYBOSS));
    DelayCommand(14.0, MusicBattlePlay(oArea));


        //Change the camera setting
        CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 7.0, 70.0,
                     CAMERA_TRANSITION_TYPE_SNAP);
        //CutSetCamera(9.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 15.0, 50.0,
        //             CAMERA_TRANSITION_TYPE_SNAP);
        //CutSetCamera(16.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 8.0, 50.0,
        //             CAMERA_TRANSITION_TYPE_SLOW);
        //CutSetCamera(23.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 8.0, 20.0,
        //             CAMERA_TRANSITION_TYPE_SLOW);
        // CutSetCamera(28.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 20.0, 50.0,
        //              CAMERA_TRANSITION_TYPE_SLOW);


    //Now all the PCs should be downstairs and able to watch the last of the cutscene
    CutSetFacingPoint(7.5, oDurnan, "pre_linu", FALSE);
    CutSetFacingPoint(7.6, oTomi, "q2adurnan", FALSE);
    CutSetFacingPoint(7.6, oLinu, "q2adurnan", FALSE);
    CutSetFacingPoint(7.3, oPC, "q2adurnan", FALSE);
    CutSetFacingPoint(7.1, oSharwyn, "q2adurnan", FALSE);
    CutSetFacingPoint(7.7, oDaelan, "q2adurnan", FALSE);

    CutSpeakStringByStrRef(8.0, oDurnan, 83966);

    CutSpeakStringByStrRef(12.5, oDurnan, 83967);

    //Create cutscene beholder
    location lVfx1 = GetLocation(GetWaypointByTag("wp_q2awellvfx_1"));
    location lVfx2 = GetLocation(GetWaypointByTag("wp_q2awellvfx_2"));
    location lVfx3 = GetLocation(GetWaypointByTag("wp_q2awellvfx_3"));
    location lVfx4 = GetLocation(GetWaypointByTag("wp_q2awellvfx_4"));

    CutPlaySound(14.5, oPC, "as_cv_bldgcrumb3", FALSE);
    CutApplyEffectAtLocation(15.0, oPC, DURATION_TYPE_INSTANT, 353, lVfx1);
    CutApplyEffectAtLocation(15.0, oPC, DURATION_TYPE_INSTANT, 353, lVfx2);
    CutApplyEffectAtLocation(15.0, oPC, DURATION_TYPE_INSTANT, 354, lVfx3);
    CutApplyEffectAtLocation(15.0, oPC, DURATION_TYPE_INSTANT, 353, lVfx4);
    location lTarget3 = GetLocation(oWell);
    location lTarget4 = GetLocation(GetObjectByTag("beholderspawn"));
    //CutCreateObject(12.0, oPC, OBJECT_TYPE_CREATURE, "cut5beholder", lTarget, VFX_NONE);
    CutJumpToLocation(16.0, oBeholder, lTarget3, FALSE);
    //CutApplyEffectToObject2(16.0, DURATION_TYPE_INSTANT, EffectDisappearAppear(lTarget4), oBeholder);
    CutJumpToLocation(16.0, oBeholder, lTarget4, FALSE);
    //The NPCs speak
    CutSpeakStringByStrRef(17.0, oTomi, 83968);
    CutSpeakStringByStrRef(17.5, oLinu, 83969);
    CutSpeakStringByStrRef(17.7, oSharwyn, 83970);
    CutSpeakStringByStrRef(19.8, oTomi, 83971);
    //Durnan turns to the beholder
    CutSetFacingPoint(15.5, oDurnan, "wp_q2awellvfx_3");
    //Beholder blasts him
    //AssignCommand(oBeholder, CutApplyEffectToObject2(13.6, DURATION_TYPE_TEMPORARY, EffectLinkEffects(EffectVisualEffect(VFX_IMP_MIRV), EffectVisualEffect(VFX_IMP_BREACH)), oDurnan, 2.0));

    AssignCommand(oBeholder, CutApplyEffectToObject2(17.6, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_EVIL, oBeholder, BODY_NODE_MONSTER_1), oDurnan, 2.0));
    AssignCommand(oBeholder, CutApplyEffectToObject2(17.6, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_EVIL, oBeholder, BODY_NODE_MONSTER_2), oPC, 2.0));

    //Durnan appears deadish/paralyzed
    CutPlayAnimation(19.2, oDurnan, ANIMATION_LOOPING_CONJURE2, 3.0, FALSE);
    CutApplyEffectToObject2(19.6, DURATION_TYPE_TEMPORARY, EffectParalyze(), oDurnan, 19.0, FALSE);
    CutApplyEffectToObject(19.6, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oDurnan, 19.0, FALSE);
    CutApplyEffectToObject(19.6, DURATION_TYPE_TEMPORARY, VFX_DUR_PARALYZE_HOLD, oDurnan, 19.0, FALSE);

    CutPlayAnimation(19.2, oDurnan, ANIMATION_FIREFORGET_TAUNT, 3.0, FALSE);

    CutApplyEffectToObject2(19.6, DURATION_TYPE_TEMPORARY, EffectParalyze(), oPC, 28.0, FALSE);
    CutApplyEffectToObject(19.6, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oPC, 28.0, FALSE);
    CutApplyEffectToObject(19.6, DURATION_TYPE_TEMPORARY, VFX_DUR_PARALYZE_HOLD, oPC, 28.0, FALSE);

    //CutPlayAnimation(19.6, oDurnan, ANIMATION_LOOPING_DEAD_FRONT, 20.0);

    //Adventurers attack beholder...

    //DelayCommand(16.0, AssignCommand(oDurst, ActionAttack(GetObjectByTag("cut5beholder"))));
    //DelayCommand(16.5, AssignCommand(oBrit, ActionAttack(GetObjectByTag("cut5beholder"))));
    //DelayCommand(16.5, AssignCommand(oTethlan, ActionAttack(GetObjectByTag("cut5beholder"))));
    DelayCommand(20.0, ChangeToStandardFaction(oBeholder, STANDARD_FACTION_HOSTILE));
    CutActionAttack(20.0, oDaelan, oBeholder);
    CutActionCastSpellAtObject(20.5, SPELL_GREAT_THUNDERCLAP, oLinu, oBeholder, METAMAGIC_ANY, TRUE);
    //CutActionAttack(21.5, oBrit, oBeholder);
    CutActionAttack(21.5, oSharwyn, oBeholder);

    //Beholder turns and goes down the well...
    CutClearAllActions(24.0, oBeholder, TRUE, FALSE);
    CutSpeakStringByStrRef(24.8, oDaelan, 83972);
    CutJumpToLocation(24.5, oBeholder, lTarget3, FALSE);
    //DelayCommand(20.5, DestroyObject(oBeholder));
    CutDestroyObject(26.5, oBeholder, FALSE);
    //DelayCommand(20.0, AssignCommand(oDurst, ClearAllActions(TRUE)));
    CutClearAllActions(25.0, oDaelan, TRUE, FALSE);
    CutClearAllActions(25.0, oLinu, TRUE, FALSE);
    CutClearAllActions(25.0, oTomi, TRUE, FALSE);
    CutClearAllActions(25.0, oSharwyn, TRUE, FALSE);
    //Move PC Camera
    CutActionMoveToLocation(17.0, oPC,lTarget2, FALSE);
    //Jera will go to Durnan
    CutActionMoveToObject(25.0, oLinu, oDurnan, TRUE);
    CutPlayAnimation(28.0, oLinu, ANIMATION_LOOPING_GET_MID, 1.0);
    CutSpeakStringByStrRef(30.5, oLinu, 83973);
    CutSpeakStringByStrRef(32.5, oSharwyn, 83974);

    //The adventurers all go to the well and dissappear
    CutActionMoveToLocation(34.0, oTomi, lVfx1, TRUE);
    CutActionMoveToLocation(34.0, oLinu, lVfx2, TRUE);
    CutActionMoveToLocation(34.0, oSharwyn, lVfx3, TRUE);
    CutActionMoveToLocation(34.0, oDaelan, lVfx4, TRUE);

    CutDestroyObject(35.0, oTomi, FALSE);
    CutDestroyObject(35.0, oSharwyn, FALSE);
    CutDestroyObject(35.0, oLinu, FALSE);
    CutDestroyObject(35.0, oDaelan, FALSE);
    DelayCommand(35.0, SetLocalInt(GetModule(), "X2_CutScene5a", 0));

    location lWellSpawn = GetLocation(GetWaypointByTag("mn_q2a_thewell"));
    //Destroy fake well - make real well
//    CutDestroyObject(36.0, oWell);
//    CutCreateObject(36.0, oPC, OBJECT_TYPE_PLACEABLE, "q2awell", lWellSpawn, 0);
    oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        CutFadeOutAndIn(35.5, oPlayers);
        //GetPCNumber and jump the PC upstairs
        nPCNumber = GetLocalInt(oPlayers, "nPCNumber");
        //First five PCs have their own waypoint...
        //remove invisiblity effect

        //Remove effects from any henchmen
        //if (nPCNumber < 6)
        //{
       //     CutJumpToObject(38.5, oPlayers, GetWaypointByTag("wp_cut5b_pc" + IntToString(nPCNumber)));
       // }
       // else
       // {
       //     CutJumpToObject(38.5, oPlayers, GetWaypointByTag("wp_cut5b_pcx" + IntToString(nPCNumber)));
       // }
       oPlayers = GetNextPC();
    }
    CutDisableCutscene(52, 38.5, 38.5, RESTORE_TYPE_NONE);

}
