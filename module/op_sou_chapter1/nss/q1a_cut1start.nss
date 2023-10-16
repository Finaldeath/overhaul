//::///////////////////////////////////////////////
//:: Name q1a_cut1start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the first player leave's the top floor of
    Drogan's Home for the first floor - either by
    the door or by using their ring (mystra's hand) -
    Cutscene 1 will start.
    The PC will appear (invisible) in the middle of
    Drogan's battle with the Kobolds.  Drogan will use
    high level spells to combat the kobolds.  The
    Kobolds will keep spawning in.  Kobold Shaman will
    cast lower level spells against Drogan that he is
    protected from.  Drogan will spout lines at the Kobolds
    during the battle.
    A Kobold warrior will teleport behind Drogan, carrying a
    poison dagger - run up and stab Drogan who will collapse.
    Several kobolds will move to surround the unconscious Drogan.
    Ayala will then run in through the front door and shout
     and begin attacking the Kobolds.
    Once the Kobolds are chased off the cutscene will end and
    PC will teleport either to the top of the stairs or to
    the ring teleport location - depending on how the exited the
    top floor.  They will then be able to mop up the remaining Kobolds.

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Feb 3/03
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"

void StartCutscene1(object oPC);
void DoMissileStrike();
void CreateAsh(location lVictim);
void KillKobolds(object oDrogan);
void KoboldsToDrogan(object oDrogan);
void KoboldStrike(object oSource, object oTarget);
void KoboldsFaceAyala(object oDrogan);
void KoboldsHostile(object oDrogan);
void AyalaSpeak(object oPC);
void SwitchStaff();
void HurtDrogan(object oDrogan);
void CameraRestore(object oPC);
void ReturnPlayers();
void RemoveCutInvis(object oCreature);
void AyalaAttack();

void main()
{
        //Need to find out which PC triggered the cutscene
        //(set in either the door transition script or the mystrashand script
        //depending on how the PC came downstairs)
        object oPC;
        object oCharacter = GetFirstPC();
        while (oCharacter != OBJECT_INVALID && oPC == OBJECT_INVALID)
        {
            if (GetLocalInt(oCharacter, "nCUT1MAINPC") == 1)
                oPC = oCharacter;
            oCharacter = GetNextPC();
        }

        //Set the cutscene number on the PC
        SetLocalInt(oPC, "nCutsceneNumber", 1);

        //Change the music
        MusicBackgroundChangeDay(GetArea(OBJECT_SELF), TRACK_EVILDUNGEON2);
        MusicBackgroundChangeNight(GetArea(OBJECT_SELF), TRACK_EVILDUNGEON2);

        MusicBackgroundPlay(GetArea(OBJECT_SELF));
        //Jump PC to the main floor
        AssignCommand(oPC, JumpToObject(GetWaypointByTag("wp_cut1_pc1")));
        StartCutscene1(oPC);
}

void StartCutscene1(object oPC)
{
    //PC is immortal till after the first cutscene
    SetImmortal(oPC, TRUE);
    //Set Cutscene mode first thing
    // Start the cutscene.
    CutSetCutsceneMode(1, 0.0, oPC, TRUE);

    //Make sure hostiles will not attack PC until after cutscene is over.
    SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 100, oPC);

    // CUTSCENE VARIABLES USED
    //Numeric
    int nCutsceneNumber = 1;
    SetLocalFloat(GetArea(oPC), "cut_shift", 0.0);

    //Objects
    object oPlayers;
    object oDrogan = GetObjectByTag("Drogan");
    object oArea = GetArea(oDrogan);

    object oFootpadA = GetObjectByTag("cut1k_footpada");
    object oFootpadB = GetObjectByTag("cut1k_footpadb");
    object oFootpadC = GetObjectByTag("cut1k_footpadc");
    object oFootpadD = GetObjectByTag("cut1k_footpadd");
    object oShamanA = GetObjectByTag("cut1k_shamana");
    object oThugA = GetObjectByTag("cut1k_thuga");
    object oFrontDoor = GetObjectByTag("q1a_door_int");
    //Placeable object killers
    object oLooter1 = GetObjectByTag("cut1placethug1");
    object oLooter2 = GetObjectByTag("cut1placethug2");
    object oLooter3 = GetObjectByTag("cut1placethug3");
    object oLooter4 = GetObjectByTag("cut1placethug4");
    //objects to destroy
    object oChair1 = GetObjectByTag("q1a1chair_1");
    object oChair2 = GetObjectByTag("q1a1chair_2");
    object oChair3 = GetObjectByTag("q1a1chair_3");
    object oChair4 = GetObjectByTag("q1a1chair_4");
    object oChair5 = GetObjectByTag("q1a1chair_5");
    object oChair6 = GetObjectByTag("q1a1chair_6");
    object oChair7 = GetObjectByTag("q1a1chair_7");
    object oTable1 = GetObjectByTag("q1a1table_1");
    object oTable2 = GetObjectByTag("q1a1table_2");
    object oTable3 = GetObjectByTag("q1a1table_3");
    object oCouch1 = GetObjectByTag("q1a1couch_1");
    object oCouch2 = GetObjectByTag("q1a1couch_2");
    object oBookshelf1 = GetObjectByTag("q1abookshelf1");
    object oBooks1 = GetObjectByTag("q1abooks");
    //locations
    //Kobold movement locations
    location lKobold1_1 = GetLocation(GetWaypointByTag("wp_cut1_k1_1"));
    location lKobold2_1 = GetLocation(GetWaypointByTag("wp_cut1_k2_1"));
    location lKoboldGroup1 = GetLocation(GetWaypointByTag("wp_cut1_kgroup1"));
    //PC/camera movement locations
    location lPCTeleport = GetLocation(GetWaypointByTag("X1_TPORT_LOC"));
    location lPCCutStart = GetLocation(GetWaypointByTag("wp_cut1_pc1"));
    location lPCCutPoint1 = GetLocation(GetWaypointByTag("wp_cut1_pc2"));
    location lPCCutPoint2 = GetLocation(GetWaypointByTag("wp_cut1_pc3"));
    location lPCCutPoint3 = GetLocation(GetWaypointByTag("wp_cut1_pc4"));
    location lPCCutPoint4 = GetLocation(GetWaypointByTag("wp_cut1_pc5"));
    location lPCCutPoint5 = GetLocation(GetWaypointByTag("wp_cut1_pc6"));
    location lPCCutPoint6 = GetLocation(GetWaypointByTag("wp_cut1_pc7"));
    //Door spawn locations
    location lFrontDoor = GetLocation(GetWaypointByTag("wp_q1a_frontdoor"));
    location lStairs = GetLocation(GetWaypointByTag("wp_q2a_at_stairs"));
    //Henchmen spawn locations
    location lMischa = GetLocation(GetWaypointByTag("wp_cut1mis_spn"));
    location lXan = GetLocation(GetWaypointByTag("wp_cut1xan_spn"));
    location lDorna = GetLocation(GetWaypointByTag("wp_cut1dor_spn"));
    //Kobold Spawn locations
    location lSpawn1 = GetLocation(GetWaypointByTag("wp_cut1_kwind_spn"));
    location lSpawn2 = GetLocation(GetWaypointByTag("wp_cut1_kcel_spn"));
    location lSpawn3 = GetLocation(GetWaypointByTag("wp_cut1_kdin_spn"));
    location lSpawnExtra = GetLocation(GetWaypointByTag("cut1_extra_spawn"));
    location lSpawnAssassin = GetLocation(GetWaypointByTag("wp_cut1_assassin"));
    //Destroyed Furniture Locations
    location lDestroyed1 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_1"));
    location lDestroyed2 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_2"));
    location lDestroyed3 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_3"));
    location lDestroyed4 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_4"));
    location lDestroyed5 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_5"));
    location lDestroyed6 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_6"));
    location lDestroyed7 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_7"));
    location lDestroyed8 = GetLocation(GetWaypointByTag("wp_cut1_destroyed_8"));

    //effects
    effect eEffect = EffectVisualEffect(VFX_FNF_DISPEL);
    effect eEffectDrogan = EffectKnockdown();
    effect eTeleport = EffectVisualEffect(VFX_IMP_HEALING_G);

    //Vectors (for teleportation
    vector vXanos = GetPosition(GetWaypointByTag("wp_cut1xan_spn"));
    vector vMischa = GetPosition(GetWaypointByTag("wp_cut1mis_spn"));
    vector vDorna = GetPosition(GetWaypointByTag("wp_cut1dor_spn"));
    vector vAssassin = GetPosition(GetWaypointByTag("wp_cut1_assassin"));

    //Teleportation Locations
    vXanos = Vector(vXanos.x, vXanos.y, vXanos.z + 1.00);
    location lXanos1 = Location(GetArea(oDrogan), vXanos, 0.0);
    vMischa = Vector(vMischa.x, vMischa.y, vMischa.z + 1.00);
    location lMischa1 = Location(GetArea(oDrogan), vMischa, 0.0);
    vDorna = Vector(vDorna.x, vDorna.y, vDorna.z + 1.00);
    location lDorna1 = Location(GetArea(oDrogan), vDorna, 0.0);
    vAssassin = Vector(vAssassin.x, vAssassin.y, vAssassin.z + 1.00);
    location lAssassin1 = Location(GetArea(oDrogan), vAssassin, 0.0);

    //Next Wave of Kobolds = Create them off screen so they can have tags and
    //be moved around
    object oShamanB = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_shaman", lSpawnExtra, FALSE, "cut1k_shamanb");
    object oShamanC = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_shaman", lSpawnExtra, FALSE, "cut1k_shamanc");
    object oThugB = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_thug", lSpawnExtra, FALSE, "cut1k_thugb");
    object oThugC = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_thug", lSpawnExtra, FALSE, "cut1k_thugc");

    object oFootpadE = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1k_footpade");
    object oFootpadF = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1k_footpadf");
    object oFootpadG = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1k_footpadg");

    //Need Some Kobolds that will survive the firestorm
    object oThug1 = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_thug", lSpawnExtra, FALSE, "cut1_thuga");
    object oThug2 = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_thug", lSpawnExtra, FALSE, "cut1_thugb");
    object oAssassin = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_assassin", lSpawnExtra, FALSE, "cut1_assassin");
    object oFootpad1 = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1_footpada");
    object oFootpad2 = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1_footpadb");
    object oFootpad3 = CreateObject(OBJECT_TYPE_CREATURE, "cut1k_footpad", lSpawnExtra, FALSE, "cut1_footpadc");
    object oLooter5 = CreateObject(OBJECT_TYPE_CREATURE, "cut1placethug", lSpawnExtra, FALSE, "cut1placethug5");
    object oLooter6 = CreateObject(OBJECT_TYPE_CREATURE, "cut1placethug", lSpawnExtra, FALSE, "cut1placethug6");
    object oLooter7 = CreateObject(OBJECT_TYPE_CREATURE, "cut1placethug", lSpawnExtra, FALSE, "cut1placethug7");
    object oLooter8 = CreateObject(OBJECT_TYPE_CREATURE, "cut1placethug", lSpawnExtra, FALSE, "cut1placethug8");
    object oKLast1 = CreateObject(OBJECT_TYPE_CREATURE, "q1a_k_thug", lSpawnExtra, FALSE, "q1a_k_thug_1");
    object oKLast2 = CreateObject(OBJECT_TYPE_CREATURE, "q1a_k_thug", lSpawnExtra, FALSE, "q1a_k_thug_2");

    //Set AI levels higher
    SetAILevel(oDrogan, AI_LEVEL_NORMAL);
    SetAILevel(oFootpadA, AI_LEVEL_NORMAL);
    SetAILevel(oFootpadB, AI_LEVEL_NORMAL);
    SetAILevel(oShamanA, AI_LEVEL_NORMAL);

    BlackScreen(oPC);
    //Change the music

    MusicBattleChange(oArea, TRACK_BATTLE_ARIBETH);
    MusicBattlePlay(oArea);

    AssignCommand(oFrontDoor, ActionOpenDoor(oFrontDoor));

    // Turn the PC to invisible.
    AssignCommand(oDrogan, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC));
    //Fade Picture In...
    DelayCommand(1.5, FadeFromBlack(oPC, FADE_SPEED_FAST));
    //Have caption over top of PC
    DelayCommand(5.5, FloatingTextStrRefOnCreature(40415, oPC));

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    // Set the initial camera.
    CutSetCamera(nCutsceneNumber, 0.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    //Move PC To First Location
    CutActionMoveToLocation(nCutsceneNumber, 1.0, oPC, lPCCutPoint1, FALSE, FALSE);
    CutSetCamera(nCutsceneNumber, 1.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    //Move PC to second location
    CutActionMoveToLocation(nCutsceneNumber, 8.0, oPC, lPCCutPoint2, FALSE, FALSE);

    CutSetCamera(nCutsceneNumber, 10.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);

    //Move PC to third location
    CutSetCamera(nCutsceneNumber, 11.0, oPC, CAMERA_MODE_TOP_DOWN, 200.0, 15.0, 50.0,
                CAMERA_TRANSITION_TYPE_SLOW);

    //Move PC to fourth location
    CutSetCamera(nCutsceneNumber, 22.0, oPC, CAMERA_MODE_TOP_DOWN, 275.0, 8.0, 40.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    //Move PC to fifth location
    CutSetCamera(nCutsceneNumber, 29.0, oPC, CAMERA_MODE_TOP_DOWN, 255.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutActionMoveToLocation(nCutsceneNumber, 33.0, oPC, lPCTeleport, FALSE, FALSE);


    // Drogan start's with shielding up
    CutApplyEffectToObject(nCutsceneNumber, 0.0, DURATION_TYPE_PERMANENT, VFX_DUR_GLOBE_INVULNERABILITY,
                           oDrogan, 9999.0);

    //Kobold Ambient Angry Animations
    CutPlayAnimation(nCutsceneNumber, 0.0, oFootpadA, ANIMATION_FIREFORGET_TAUNT, 2.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 0.0, oFootpadB, ANIMATION_FIREFORGET_VICTORY3, 4.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 0.0, oFootpadC, ANIMATION_FIREFORGET_VICTORY2, 11.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 0.0, oFootpadD, ANIMATION_FIREFORGET_TAUNT, 11.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 0.0, oShamanA, ANIMATION_LOOPING_CONJURE2, 13.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 0.0, oThugA, ANIMATION_FIREFORGET_TAUNT, 11.8, FALSE);

    //Kobold Looters will start destroying furniture

    DelayCommand(9.0, AssignCommand(oLooter1, ActionAttack(oTable1)));
    DelayCommand(9.0, AssignCommand(oLooter2, ActionAttack(oTable2)));
    DelayCommand(9.0, AssignCommand(oLooter3, ActionAttack(oChair2)));
    DelayCommand(9.0, AssignCommand(oLooter4, ActionAttack(oCouch1)));
    DelayCommand(14.0, AssignCommand(oLooter3, SetFacingPoint(GetPosition(oDrogan))));
    DelayCommand(14.3, AssignCommand(oLooter4, SetFacingPoint(GetPosition(oDrogan))));
    DelayCommand(15.0, AssignCommand(oLooter3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 20.0)));
    DelayCommand(15.3, AssignCommand(oLooter4, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 20.0)));

    //Jump some of the pre-spawned looters to new positions...
    CutJumpToLocation(nCutsceneNumber, 25.0, oLooter5, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 25.5, oLooter6, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 25.5, oLooter7, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 25.0, oLooter8, lSpawn2, FALSE);
    DelayCommand(28.0, AssignCommand(oLooter5, ActionAttack(oCouch2)));
    DelayCommand(28.0, AssignCommand(oLooter6, ActionAttack(oTable3)));
    DelayCommand(28.0, AssignCommand(oLooter7, ActionAttack(oChair6)));
    DelayCommand(28.0, AssignCommand(oLooter8, ActionAttack(oBookshelf1)));

    //Spawn in Destroyed Furniture
    CutApplyEffectToObject2(nCutsceneNumber, 14.2, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair1, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 14.1, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair2, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 13.9, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair3, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 13.3, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair4, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 13.2, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair5, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 13.0, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oTable1, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 13.0, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oTable2, 0.0);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc06", lDestroyed1, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc08", lDestroyed2, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc08", lDestroyed3, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc03", lDestroyed4, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc04", lDestroyed5, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 12.25, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc03", lDestroyed6, 0, FALSE);

    CutApplyEffectToObject2(nCutsceneNumber, 33.0, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair6, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 34.0, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oChair7, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 33.6, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oBookshelf1, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 33.5, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oBooks1, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 33.5, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oTable3, 0.0);
    CutApplyEffectToObject2(nCutsceneNumber, 33.9, DURATION_TYPE_INSTANT, EffectDamage(5),
                           oCouch2, 0.0);
    CutCreateObject(nCutsceneNumber, 34.0, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc06", lDestroyed7, 0, FALSE);
    CutCreateObject(nCutsceneNumber, 34.0, oPC, OBJECT_TYPE_PLACEABLE, "x1_misc08", lDestroyed8, 0, FALSE);

    //Drogan will wipe out the first two Kobolds.
    //Have 2 Kobolds charge Drogan..
    DelayCommand(4.0, AssignCommand(oFootpadA, ActionAttack(oDrogan)));
    DelayCommand(6.0, AssignCommand(oFootpadB, ActionAttack(oDrogan)));
    // Have Drogan cast - kobold freezes and bigby's hand crushes him
    CutActionCastFakeSpellAtObject(nCutsceneNumber, 1.0, SPELL_BIGBYS_CRUSHING_HAND, oDrogan, oFootpadA, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
    CutApplyEffectToObject(nCutsceneNumber, 3.9, DURATION_TYPE_TEMPORARY, VFX_DUR_BIGBYS_CRUSHING_HAND, oFootpadA, 4.2);
    DelayCommand(5.5, AssignCommand(oFootpadA, ClearAllActions()));
    //And then cast again at second kobold
    CutActionCastFakeSpellAtObject(nCutsceneNumber, 6.0, SPELL_BIGBYS_CRUSHING_HAND, oDrogan, oFootpadB, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
    CutApplyEffectToObject(nCutsceneNumber, 10.0, DURATION_TYPE_TEMPORARY, VFX_DUR_BIGBYS_CRUSHING_HAND, oFootpadB, 4.2);
    DelayCommand(10.0, AssignCommand(oFootpadB, ClearAllActions()));

    DelayCommand(5.0, SetPlotFlag(oFootpadA, FALSE));
    CutDeath(nCutsceneNumber, 8.0, oFootpadA, TRUE, FALSE);
    DelayCommand(7.0, SetPlotFlag(oFootpadB, FALSE));
    CutDeath(nCutsceneNumber, 12.5, oFootpadB, TRUE, FALSE);


    //Drogan speaks
    CutSpeakStringByStrRef(nCutsceneNumber, 16.5, oDrogan, 76205, FALSE);
    //CutPlayVoiceChat(nCutsceneNumber, 11.5, oPC, VOICE_CHAT_BATTLECRY1, oDrogan);

    // Have Kobold cast
    DelayCommand(14.0, AssignCommand(oShamanA, KoboldStrike(oShamanA, oDrogan)));
    // Other Kobolds Charge
    CutActionMoveToLocation(nCutsceneNumber, 12.0, oFootpadC, lKoboldGroup1, TRUE, FALSE);
    CutActionMoveToLocation(nCutsceneNumber, 12.0, oFootpadD, lKoboldGroup1, TRUE, FALSE);
    CutActionMoveToLocation(nCutsceneNumber, 12.0, oThugA, lKoboldGroup1, TRUE, FALSE);

    //Drogan turns..
    CutSetFacingPoint(nCutsceneNumber, 15.5, oDrogan,"cut1k_shamana" , FALSE);

    //Drogan fires a missile storm.
    CutActionCastFakeSpellAtObject(nCutsceneNumber, 15.0, SPELL_DARKNESS, oDrogan, oFootpadC, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);
    DelayCommand(17.5, DoMissileStrike());

    //Break some glass
    CutPlaySound(nCutsceneNumber, 21.0, oPC, "as_cv_glasbreak3", FALSE);

    //Jump some of the pre-spawned in kobolds to new positions...
    CutJumpToLocation(nCutsceneNumber, 21.0, oShamanB, lSpawn1, FALSE);
    CutJumpToLocation(nCutsceneNumber, 21.0, oShamanC, lSpawn3, FALSE);
    CutJumpToLocation(nCutsceneNumber, 21.0, oFootpadE, lSpawn1, FALSE);
    CutJumpToLocation(nCutsceneNumber, 21.0, oFootpadF, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 21.0, oThugB, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 21.0, oFootpadG, lSpawn3, FALSE);


    DelayCommand(21.5, AssignCommand(oFootpadE, ActionAttack(oDrogan)));
    DelayCommand(21.5, AssignCommand(oFootpadF, ActionAttack(oDrogan)));
    DelayCommand(21.5, AssignCommand(oThugB, ActionAttack(oDrogan)));
    DelayCommand(21.5, AssignCommand(oFootpadG, ActionAttack(oDrogan)));

    // Have Kobolds cast
    DelayCommand(18.0, SetAILevel(oShamanB, AI_LEVEL_NORMAL));
    DelayCommand(18.0, SetAILevel(oShamanC, AI_LEVEL_NORMAL));

    DelayCommand(21.5, AssignCommand(oShamanC, KoboldStrike(oShamanC, oDrogan)));
    DelayCommand(21.5, AssignCommand(oShamanB, KoboldStrike(oShamanB, oDrogan)));

    //Drogan speaks
    CutSpeakStringByStrRef(nCutsceneNumber, 21.5, oDrogan, 76207, FALSE);
    //CutPlayVoiceChat(nCutsceneNumber, 22.0, oPC, VOICE_CHAT_BATTLECRY3, oDrogan);

    // Have Kobold cast
    DelayCommand(21.0, AssignCommand(oShamanA, KoboldStrike(oShamanA, oDrogan)));

    // Have Kobolds cast
    DelayCommand(22.5, AssignCommand(oShamanC, KoboldStrike(oShamanC, oDrogan)));
    DelayCommand(22.8, AssignCommand(oShamanB, KoboldStrike(oShamanB, oDrogan)));
    DelayCommand(23.3, AssignCommand(oShamanA, KoboldStrike(oShamanA, oDrogan)));
    //Drogan fires a fire storm.
    CutActionCastFakeSpellAtObject(nCutsceneNumber, 25.5, SPELL_DARKNESS, oDrogan, oFootpadG, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);

    CutApplyEffectAtLocation(nCutsceneNumber, 26.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIRESTORM,
                             GetLocation(oDrogan), 10.0);
    DelayCommand(26.0, KillKobolds(oDrogan));

    //More Kobolds appear - drogan attacks - assassin teleports behind him and strikes
    //him down...

    //Jump some of the pre-spawned in kobolds to new positions...
    CutJumpToLocation(nCutsceneNumber, 27.0, oThug1, lSpawn1, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.5, oThug2, lSpawn3, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.5, oFootpad1, lSpawn1, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.0, oFootpad2, lSpawn2, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.5, oFootpad3, lSpawn3, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.5, oKLast1, lFrontDoor, FALSE);
    CutJumpToLocation(nCutsceneNumber, 27.5, oKLast2, lFrontDoor, FALSE);

    //Play some angry animatations
    CutPlayAnimation(nCutsceneNumber, 28.0, oThug1, ANIMATION_FIREFORGET_VICTORY1, 5.0, FALSE);
    CutPlayAnimation(nCutsceneNumber, 28.5, oThug2, ANIMATION_FIREFORGET_VICTORY2, 5.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 28.5, oFootpad1, ANIMATION_FIREFORGET_VICTORY3, 5.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 28.0, oFootpad2, ANIMATION_FIREFORGET_VICTORY2, 5.8, FALSE);
    CutPlayAnimation(nCutsceneNumber, 28.5, oFootpad3, ANIMATION_FIREFORGET_VICTORY1, 5.8, FALSE);

    //Jump in Assassin

    CutApplyEffectAtLocation(nCutsceneNumber, 30.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G,
                             lSpawnAssassin);
    CutApplyEffectAtLocation(nCutsceneNumber, 30.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G,
                             lAssassin1);
    CutApplyEffectAtLocation(nCutsceneNumber, 30.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SOUND_BURST,
                             lSpawnAssassin);

    CutJumpToLocation(nCutsceneNumber, 30.7, oAssassin, lSpawnAssassin, FALSE);

    //Drogan speaks
    //CutSpeakStringByStrRef(nCutsceneNumber, 25.0, oDrogan, 40366, FALSE);
    //Drogan turns..
    CutSetFacingPoint(nCutsceneNumber, 26.0, oDrogan,"wp_cut1_droganface" , FALSE);
    DelayCommand(31.5, AssignCommand(oAssassin, ActionAttack(oDrogan)));

    //Drogan speaks
    CutSpeakStringByStrRef(nCutsceneNumber, 33.5, oDrogan, 76216, FALSE);
    //CutPlayVoiceChat(nCutsceneNumber, 33.5, oPC, VOICE_CHAT_DEATH, oDrogan);

    CutApplyEffectToObject(nCutsceneNumber, 33.7, DURATION_TYPE_INSTANT, VFX_IMP_GLOBE_USE, oDrogan);
    CutRemoveEffects(nCutsceneNumber, 34.0, oDrogan, FALSE);

    DelayCommand(34.5, AssignCommand(oAssassin, ClearAllActions(TRUE)));

    CutPlayAnimation(nCutsceneNumber, 35.0, oAssassin, ANIMATION_FIREFORGET_VICTORY1, 2.0, FALSE);
    CutPlayAnimation(nCutsceneNumber, 35.5, oAssassin, ANIMATION_FIREFORGET_VICTORY2, 2.0, FALSE);

    DelayCommand(34.5, KoboldsToDrogan(oDrogan));
    DelayCommand(29.0, SetPlotFlag(oDrogan, FALSE));
    CutPlayAnimation(nCutsceneNumber, 33.7, oDrogan, ANIMATION_LOOPING_DEAD_BACK, 9999.0, FALSE);
    DelayCommand(34.5, SetPlotFlag(oDrogan, TRUE));
    DelayCommand(38.0, SetCommandable(FALSE, oDrogan));
    //Front Door Opens..and Ayala comes in
    CutCreateObject(nCutsceneNumber, 35.5, oPC, OBJECT_TYPE_CREATURE, "Ayala", lFrontDoor, 0, FALSE);

    //Ayala speaks
    DelayCommand(37.0, AyalaSpeak(oPC));


    //Some Kobolds run out
    CutActionMoveToLocation(nCutsceneNumber, 34.7, oFootpad3, lFrontDoor, TRUE, FALSE);
    CutActionMoveToLocation(nCutsceneNumber, 34.7, oThug2, lFrontDoor, TRUE, FALSE);


    //DelayCommand(36.0, AssignCommand(GetObjectByTag("ayala"), SpeakString("Master Drogan!! No, I am too late!")));
    DelayCommand(36.0, KoboldsFaceAyala(oDrogan));
    DelayCommand(39.0, AssignCommand(GetObjectByTag("Ayala"), ActionAttack(oAssassin)));
    DelayCommand(39.0, KoboldsHostile(oDrogan));
    DelayCommand(43.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oAssassin));

    //Spawn in the 3 henchmen...
    // with teleportation effect
    CutCreateObject(nCutsceneNumber, 38.0, oPC, OBJECT_TYPE_CREATURE, "x0_hen_mis", lMischa, VFX_IMP_HEALING_G, FALSE);
    CutCreateObject(nCutsceneNumber, 38.5, oPC, OBJECT_TYPE_CREATURE, "x0_hen_xan", lXan, VFX_IMP_HEALING_G, FALSE);
    CutCreateObject(nCutsceneNumber, 38.7, oPC, OBJECT_TYPE_CREATURE, "x0_hen_dor", lDorna, VFX_IMP_HEALING_G, FALSE);
    CutApplyEffectAtLocation(nCutsceneNumber, 38.5, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G,
                             lMischa1);
    CutApplyEffectAtLocation(nCutsceneNumber, 38.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G,
                             lXanos1);
    CutApplyEffectAtLocation(nCutsceneNumber, 38.7, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G,
                             lDorna1);

    DelayCommand(43.0, SetLocalInt(GetModule(), "X1_CUT1RUNNING", 2));
    DelayCommand(43.0, ReturnPlayers());
    //Try to end the cutscene battle music
    //DelayCommand(43.0, MusicBattleStop(oArea));
    //Take care of Drogan's staff and knock him down in hit points.

    DelayCommand(43.0, SwitchStaff());

    //Take care of upstairs door
    object oTopFloorDoor = GetObjectByTag("q1a2doortop");
    DelayCommand(43.0, SetLocalInt(oTopFloorDoor, "nCutSceneReady", 2));
    DelayCommand(43.0, SetLocked(oTopFloorDoor, FALSE));
    //Make sure Ayala is attacking
    DelayCommand(45.0, AyalaAttack());


}

void DoMissileStrike()
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        object oDrogan = GetObjectByTag("Drogan");
        object oTarget = GetObjectByTag("cut1k_shamana");
        int nCasterLvl = 16;
        int nDamage = 0;
        int nCnt;
        effect eMissile = EffectVisualEffect(VFX_IMP_MIRV);
        effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
        float fDist = GetDistanceBetween(oDrogan, oTarget);
        float fDelay = fDist/(3.0 * log(fDist) + 2.0);
        float fDelay2, fTime;
        location lTarget = GetLocation(oDrogan); // missile spread centered around caster
        location lVictim;
        int nMissiles = nCasterLvl;
        object oVictim;
        //Apply a single damage hit for each missile instead of as a single mass
        for (nCnt = 1; nCnt <= nMissiles; nCnt++)
        {
            oVictim = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE, OBJECT_TYPE_CREATURE);
            //oVictim = GetNearestCreature(GetArea(oDrogan));
            fTime = 0.5;
            //Cycle through the targets within the spell shape until an invalid object is captured.
            while (GetIsObjectValid(oVictim) && nCnt <= nMissiles  && GetObjectType(oVictim) == OBJECT_TYPE_CREATURE && GetIsDead(oVictim) == FALSE)
            {
                // * caster cannot be harmed by this spell
                if (oVictim != oDrogan && GetIsPC(oVictim) == FALSE)
                {
                    lVictim = GetLocation(oVictim);
                    fDelay2 += 0.1;

                    fTime += fDelay2;

                    //Set damage effect
                    effect eDam = EffectDeath(TRUE);
                    SetPlotFlag(oVictim, FALSE);
                    //Apply the MIRV and damage effect
                    DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oVictim));
                    DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oVictim));

                    DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oVictim));
                    //DelayCommand(fTime, CreateAsh(lVictim));

                }// reactiontype if
                //oVictim = GetNextObjectInArea(GetArea(oDrogan));
                oVictim = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE, OBJECT_TYPE_CREATURE);
                nMissiles = nMissiles -1;
            }// while
        }//for
    }//if
}

void CreateAsh(location lVictim)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_weathmark", lVictim);
    }
}
void KillKobolds(object oDrogan)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        //Set damage effect
        effect eDeath = EffectDeath(TRUE);
        float fDelay;
        object oKobold = GetFirstObjectInArea(GetArea(oDrogan));
        while (oKobold != OBJECT_INVALID)
        {
            if (GetStringLeft(GetTag(oKobold), 5) == "cut1k")
            {
                fDelay = IntToFloat(Random(20))/10.0;
                SetPlotFlag(oKobold, FALSE);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectVisualEffect(VFX_COM_HIT_FIRE), eDeath), oKobold));
                DelayCommand(fDelay, CreateAsh(GetLocation(oKobold)));
            }
            oKobold = GetNextObjectInArea(GetArea(oDrogan));
        }
    }
}

void KoboldsToDrogan(object oDrogan)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        object oKobold = GetFirstObjectInArea(GetArea(oDrogan));
        float fDelay;
        while (oKobold != OBJECT_INVALID)
        {
            if (GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_B)
            {
                if (GetStringLeft(GetTag(oKobold), 7) != "cut1pla" && GetTag(oKobold) != "cut1_footpadb")
                {
                    AssignCommand(oKobold, ActionMoveToLocation(GetLocation(oDrogan), FALSE));
                }
            }
            oKobold = GetNextObjectInArea(GetArea(oDrogan));
        }
    }
}

void KoboldStrike(object oSource, object oTarget)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        //SetPlotFlag(oTarget, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MIRV), oTarget);
        float fDist = GetDistanceBetween(oSource, oTarget);
        float fDelay = fDist/(3.0 * log(fDist) + 2.0);
        //Set damage effect
        effect eDam = EffectVisualEffect(VFX_IMP_GLOBE_USE);
        //Apply the MIRV and damage effect
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
    }
}

void KoboldsFaceAyala(object oDrogan)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        object oKobold = GetFirstObjectInArea(GetArea(oDrogan));

        while (oKobold != OBJECT_INVALID)
        {
            if (GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_B)
            {
                if (GetIsDead(oKobold) == FALSE)
                {
                    AssignCommand(oKobold, SetFacingPoint(GetPosition(GetObjectByTag("Ayala"))));
                }
            }
            oKobold = GetNextObjectInArea(GetArea(oDrogan));
        }
     }
}

void KoboldsHostile(object oDrogan)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        object oKobold = GetFirstObjectInArea(GetArea(oDrogan));

        while (oKobold != OBJECT_INVALID)
        {
            if (GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_B || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_B)
            {
                //if (GetStringLeft(GetTag(oKobold), 7) != "cut1pla")
                //{
                    SetPlotFlag(oKobold, FALSE);
                    ChangeToStandardFaction(oKobold, STANDARD_FACTION_HOSTILE);
                //}
            }
            oKobold = GetNextObjectInArea(GetArea(oDrogan));
        }
    }
}

void AyalaSpeak(object oPC)
{
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        object oAyala = GetObjectByTag("Ayala");
        AssignCommand(oAyala, SpeakStringByStrRef(76087, TALKVOLUME_SHOUT));
        AssignCommand(oAyala, PlaySoundByStrRef(76087, FALSE));
        //CutPlayVoiceChat(1, 0.0, oPC, VOICE_CHAT_BATTLECRY3, oAyala);
    }
}

void SwitchStaff()
{
    //if the first cutscene is not over ..i.e. skipped
    if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2)
    {
        object oDrogan = GetObjectByTag("Drogan");
        SetPlotFlag(oDrogan, FALSE);
        object oStaff = GetItemPossessedBy(oDrogan, "walkingstick");
        DestroyObject(oStaff);
        CreateObject(OBJECT_TYPE_ITEM, "walkingstick", GetLocation(GetWaypointByTag("wp_q1a1_staff")));

        int nDamage = GetCurrentHitPoints(oDrogan) - 10;
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_DIVINE), oDrogan);
        SetPlotFlag(oDrogan, TRUE);
        SetAILevel(oDrogan, AI_LEVEL_DEFAULT);
    }
}

void CameraRestore(object oPC)
{
    //if the first cutscene is not over ..i.e. skipped
    if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2)
    {
        RestoreCameraFacing();
    }
}

void ReturnPlayers()
{
    //Return ALL PCs to starting positions if they joined the cutscene
    //If the PC came from the stairs - appear at the stairs
    location lTarget1, lLooter;
    //PC movement locations
    location lPCTeleport = GetLocation(GetWaypointByTag("X1_TPORT_LOC"));
    location lStairs = GetLocation(GetWaypointByTag("wp_q2a_at_stairs"));
    vector vTarget;
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 1;
    while (oPlayers != OBJECT_INVALID)
    {

        if (GetLocalInt(oPlayers, "nCutsceneNumber") == 1)
        {
            AssignCommand(oPlayers, ClearAllActions());
            CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);
            //If the player came down from the stairs
            if (GetLocalInt(oPlayers, "nQ1AStairs") == 1)
            {
                CutJumpToLocation(nCutsceneNumber, 2.75, oPlayers, lStairs, FALSE);
                SetLocalInt(GetArea(oPlayers), "nPCONSTAIRS", 1);
            }
            //IF the player teleported down
            else
            {
                //Only create 1 set of effects or it will get crazy
                if (GetLocalInt(GetModule(),"X1_Q1PORTALJUMP") != 1)
                {
                    SetLocalInt(GetModule(), "X1_Q1PORTALJUMP", 1);
                    vTarget= GetPosition(GetWaypointByTag("X1_TPORT_LOC"));
                    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
                    lTarget1 = Location(GetArea(GetWaypointByTag("wp_cut1_pcend")), vTarget, 0.0);

                    CutApplyEffectAtLocation(nCutsceneNumber, 2.75, oPlayers, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G, lPCTeleport, 0.0, FALSE);
                    CutApplyEffectAtLocation(nCutsceneNumber, 2.75, oPlayers, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_G, lTarget1, 0.0, FALSE);
                }
                CutJumpToLocation(nCutsceneNumber, 1.75, oPlayers, lPCTeleport, FALSE);

            }
            //Make sure hostiles will not attack PC until after cutscene is over.
            DelayCommand(3.0, SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 0, oPlayers));

            DelayCommand(3.0, RemoveCutInvis(oPlayers));
            CutSetCutsceneMode(nCutsceneNumber, 3.0, oPlayers, FALSE);
            DelayCommand(5.0, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
            object oTrigger = GetObjectByTag("q1a1_entstart_cut1");
            SetLocalInt(oTrigger, "nCutSceneReady", 0);

        }

        oPlayers = GetNextPC();
    }

}

void RemoveCutInvis(object oCreature)
{
    object oDrogan = GetObjectByTag("Drogan");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oDrogan))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}

void AyalaAttack()
{
    object oAyala = GetObjectByTag("Ayala");
    object oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, oAyala);
    AdjustReputation(oKobold, oAyala, -100);
    AssignCommand(oAyala, ActionAttack(oKobold));

}

