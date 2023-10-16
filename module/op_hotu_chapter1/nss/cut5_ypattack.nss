//::///////////////////////////////////////////////
//:: Name: cut5_ypattack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Durnan's end of conversation functions.
    If Module variable DurnanSpoke is 0 - and the
    PC hero is the PC Speaker in the conversation,
    then this is Durnans speech in the Yawning Portal.
    After the Speech -
    A few drow will appear at the top of the stairs,
    the camera will focus on their leader.
    Camera will return to Durnan.  Durnan will draw
    his sword and speak.
    Camera will switch to drow - The drow will speak.
    Camera will switch to Durnan - He will speak again.
    Spawn in attackers throughout the Inn.
    End Cut Scene mode.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 8/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void StartCutscene5(object oPC);

void SetShift(object oPC, float fShift);
void HoldAllPlayers(object oPC);
void MakeCreature(location lTarget, string sCreature);

void Attack(object oPC)
{
    //if(CutGetActiveCutsceneForObject(oPC) == nCutsceneNumberA)
    //{
    //    ExecuteScript("cut5_ypattack", GetModule());
    //}
}

int nCutsceneNumberA = 51;

void main()
{
    int nCase = GetLocalInt(GetModule(), "DurnanSpoke");
    switch (nCase)
    {
        case 1: //End of initial speech in the yawning portal.
                //Start the attack cutscene.
                //SetLocalInt(GetModule(), "DurnanSpoke", 1);
                // Store the PC so that we can make a copy of them.
                // Cutscene number 5 continues here
                if (GetLocalInt(GetModule(), "nYPAttackDone") != 1)
                {
                    object oDurnan = GetObjectByTag("q2adurnan");
                    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oDurnan);

                    BlackScreen(oPC);
                    //CutDisableCutscene(5, 0.0, 0.0);
                    SetLocalInt(GetModule(), "nYPAttackDone", 1);

                    DelayCommand(1.0, StartCutscene5(oPC));
                }
                break;

    }
}

// Sets the shift time.
void SetShift(object oPC, float fShift)
{
     SetLocalFloat(GetArea(oPC), "cut_shift", fShift);
}

void StartCutscene5(object oPC)
{
    SetLocalInt(GetModule(), "X2_ypattack", 1);
    CutSetActiveCutsceneForObject(oPC, nCutsceneNumberA, TRUE);
    CutFadeOutAndIn(0.0, oPC, 1.5);
    SetLocalFloat(GetArea(oPC), "cut_shift", 0.0);
    CutSetActiveCutscene(nCutsceneNumberA, CUT_DELAY_TYPE_CONSTANT);
    CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, TRUE); // keep and freeze associates

    //Objects
    object oPlayers;
    object oWellDoor = GetObjectByTag("q2a_door_welltop");
    object oShooter = GetObjectByTag("q2a_cut5launch");
    object oDrezzy = GetObjectByTag("cut1_drezzy");
    object oWhite = GetObjectByTag("White");
    object oGlim = GetObjectByTag("cut1_glim");
    object oLaf = GetObjectByTag("cut1_lafontaine");
    object oParley = GetObjectByTag("cut1_parley");
    object oMhaere = GetObjectByTag("q2amhaere");
    SetAILevel(oLaf, AI_LEVEL_LOW);
    SetAILevel(oParley, AI_LEVEL_LOW);

    object oTomi = GetObjectByTag("pre_tomi");
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oSharwyn = GetObjectByTag("pre_sharwyn");
    object oTamsil = GetObjectByTag("Tamsil1");
    object oGrayban = GetObjectByTag("q2a_grayban");


    object oDurnan = GetObjectByTag("q2adurnan");
    object oPap = GetObjectByTag("cut1_pappilon");
    //Cutscene attackers
    object oDwarCleric1 = GetObjectByTag("cut1_dwarcleric1");
    object oDwarWiz1 = GetObjectByTag("cut1_dwizgen1");
    object oDwarWar1 = GetObjectByTag("cut1yp_dwar1");
    object oDwarWar2 = GetObjectByTag("cut1yp_dwar2");

    //vfx target
    object oDarkness = GetObjectByTag("q2a_darktarget");

    // Brad Prince: Added Explosions.
    object oBreak1 = GetObjectByTag("breakme1");
    object oBreak2 = GetObjectByTag("breakme2");
    object oBreak3 = GetObjectByTag("breakme3");
    object oBreak4 = GetObjectByTag("breakme4");
    object oBreak5 = GetObjectByTag("breakme5");

    CutSetActiveCutsceneForObject(oBreak1, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oBreak2, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oBreak3, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oBreak4, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oBreak5, nCutsceneNumberA);

    CutSetActiveCutsceneForObject(oWellDoor, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oShooter, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oDrezzy, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oWhite, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oGlim, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oLaf, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oParley, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oLaf, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oMhaere, nCutsceneNumberA);


    CutSetActiveCutsceneForObject(oDaelan, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oLinu, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oSharwyn, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oTomi, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oPap, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oTamsil, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oGrayban, nCutsceneNumberA);
    CutSetActiveCutsceneForObject(oDurnan, nCutsceneNumberA);

    CutSetActiveCutsceneForObject(oDarkness, nCutsceneNumberA);

    //locations
    location lDrowStart1 = GetLocation(GetWaypointByTag("wp_cut5_doorspawn"));
    location lDrowStart2 = GetLocation(GetWaypointByTag("wp_cut5_doorspawn"));
    location lDrowAttack1 = GetLocation(GetWaypointByTag("wp_cutdrowattack_1"));
    location lDrowAttack2 = GetLocation(GetWaypointByTag("wp_cutdrowattack_2"));
    location lDrowAttack3 = GetLocation(GetWaypointByTag("wp_cutdrowattack_3"));
    location lDrowAttack4 = GetLocation(GetWaypointByTag("wp_cutdrowattack_4"));
    location lDrowAttack5 = GetLocation(GetWaypointByTag("wp_cutdrowattack_5"));
    location lDrowAttack6 = GetLocation(GetWaypointByTag("wp_cutdrowattack_6"));
    object oLafStart = GetWaypointByTag("wp_cutatk_4adv_2");
    object oParleyStart = GetWaypointByTag("wp_cutatk_4adv_3");

    //effects

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 20.0, 50.0,
                        CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(12.0, oPC, CAMERA_MODE_TOP_DOWN, 10.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCamera(18.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);

    CutSetLocation(0.0, oPC);
    CutJumpToLocation(0.6, oPC, GetLocation(GetWaypointByTag("wp_cut5_pcjump1")), FALSE);

    //Create copy of PC
    location lLoc = GetLocation(oPC);
    object oCopy = CutCreatePCCopy(oPC, lLoc, "Cut5PCCopy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumberA);
    //Open the Well Door
    CutFadeFromBlack (0.7, oPC);
    AssignCommand(oWellDoor, ActionOpenDoor(oWellDoor));

    //Fire a lighting bolt or something at Papillon, killing him (coming from the freshly blasted door)
    CutActionCastFakeSpellAtObject(1.0, SPELL_FIREBALL, oShooter, oPap);

    CutApplyEffectAtLocation(1.8, oPC, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, GetLocation(oPap));
    CutApplyEffectToObject2(1.9, DURATION_TYPE_INSTANT, EffectDamage(500), oPap);
    CutApplyEffectToObject2(2.0, DURATION_TYPE_INSTANT, EffectDamage(500), oBreak1);
    CutApplyEffectToObject2(2.1, DURATION_TYPE_INSTANT, EffectDamage(500), oBreak2);
    CutApplyEffectToObject2(2.1, DURATION_TYPE_INSTANT, EffectDamage(500), oBreak3);
    CutApplyEffectAtLocation(1.9, oPC, DURATION_TYPE_INSTANT, VFX_IMP_FLAME_M, GetLocation(oBreak5));
    CutApplyEffectToObject(2.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oPC);
    CutApplyEffectToObject2(2.2, DURATION_TYPE_INSTANT, EffectDamage(500), oBreak4);
    CutApplyEffectToObject2(2.3, DURATION_TYPE_INSTANT, EffectDamage(500), oBreak5);
    //Create a couple drow near the now destroyed door and they will
    //come in to the main area of the inn.
    CutCreateObject(2.5, oPC, OBJECT_TYPE_CREATURE, "cut5_drow1", lDrowStart1, VFX_NONE);
    DelayCommand(2.9,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut5_drow1"), GetLocation(GetWaypointByTag("wp_cut5_drow1_1")), TRUE));

    CutCreateObject(3.0, oPC, OBJECT_TYPE_CREATURE, "cut5_drow2", lDrowStart2, VFX_NONE);

    DelayCommand(3.4,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut5_drow2"), GetLocation(GetWaypointByTag("wp_cut5_drow2_1")), TRUE));
//
    //Durnan will turn to look at the fuss
    CutSetFacingPoint(3.5, oDurnan, "cut5_drow1");

    //Durnan will draw his sword and speak
    CutSpeakStringByStrRef(4.0, oDurnan, 83975 );

    //Spawn in the drow wizard and move to position
    CutCreateObject(4.5, oPC, OBJECT_TYPE_CREATURE, "cut5_drowwiz1", lDrowStart2, VFX_FNF_SUMMON_MONSTER_2);
    DelayCommand(5.0,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut5_drowwiz1"), GetLocation(GetWaypointByTag("wp_cut5_drowwiz_1")), TRUE));

    //Drow will speak
    DelayCommand(6.5,
        CutSpeakStringByStrRef(0.0, GetObjectByTag("cut5_drowwiz1"), 83976));
    //Drow will cast spell effects to hold everyone momentarily
    DelayCommand(7.0,
        CutActionCastFakeSpellAtObject(0.0, SPELL_DIVINE_SHIELD, GetObjectByTag("cut5_drowwiz1"), oDurnan, PROJECTILE_PATH_TYPE_DEFAULT));

    //Turn everyone to fact the drow...
    CutSetFacingPoint(7.2, oDrezzy, "cut5_drowwiz1");
    CutSetFacingPoint(7.5, oWhite, "cut5_drowwiz1");
    CutSetFacingPoint(7.2, oGlim, "cut5_drowwiz1");
    CutSetFacingPoint(7.7, oLaf, "cut5_drowwiz1");
    CutSetFacingPoint(7.2, oParley, "cut5_drowwiz1");
   //CutSetFacingPoint(7.2, oSabine, "cut5_drowwiz1");
    //CutSetFacingPoint(7.2, oTanarell, "cut5_drowwiz1");
    CutSetFacingPoint(7.2, oDaelan, "cut5_drowwiz1");
    CutSetFacingPoint(8.0, oTomi, "cut5_drowwiz1");
    CutSetFacingPoint(7.2, oLinu, "cut5_drowwiz1");
    CutSetFacingPoint(7.5, oSharwyn, "cut5_drowwiz1");
    CutSetFacingPoint(7.2, oCopy, "cut5_drowwiz1");
    //A few NPCs charge the drow
    CutActionMoveToLocation(6.4, oLaf, GetLocation(GetWaypointByTag("wp_cutatk_sabine2")), TRUE);
    CutActionMoveToLocation(6.4, oParley, GetLocation(GetWaypointByTag("wp_cutatk_tan2")), TRUE);
    CutActionMoveToLocation(8.4, oGlim, GetLocation(GetWaypointByTag("wp_cutatk_glim2")), TRUE);

    //Apply a hold effect to all players
    DelayCommand(9.2, HoldAllPlayers(oPC));

    //More attackers stream through the door

    CutCreateObject(9.1, oPC, OBJECT_TYPE_CREATURE, "cut1yp_dwar1", lDrowStart1, VFX_NONE);
    DelayCommand(9.5,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut1yp_dwar1"), lDrowAttack1, TRUE));

    CutCreateObject(9.5, oPC, OBJECT_TYPE_CREATURE, "cut1yp_dwar2", lDrowStart1, VFX_NONE);
    DelayCommand(10.0,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut1yp_dwar2"), lDrowAttack2, TRUE));


    DelayCommand(16.0, CutActionAttack(0.0, GetObjectByTag("cut1yp_dwar1"), oDaelan));
    DelayCommand(16.0, CutActionAttack(0.0, GetObjectByTag("cut1yp_dwar2"), oMhaere));


    //NPCs will speak
    CutPlayAnimation(9.0, oLaf, ANIMATION_FIREFORGET_TAUNT, 30.0, FALSE);
    CutPlayAnimation(9.1, oParley, ANIMATION_LOOPING_CONJURE1, 30.0, FALSE);
    CutPlayAnimation(8.9, oGlim, ANIMATION_LOOPING_CONJURE2, 30.0, FALSE);

    CutPlayAnimation(9.4, oLaf, VFX_DUR_FREEZE_ANIMATION, 30.0, FALSE);
    CutPlayAnimation(9.4, oParley, VFX_DUR_FREEZE_ANIMATION, 30.0, FALSE);
    CutPlayAnimation(9.4, oGlim, VFX_DUR_FREEZE_ANIMATION, 30.0, FALSE);

    CutSpeakStringByStrRef(9.5, oLaf, 83977);
    CutSpeakStringByStrRef(9.5, oTomi, 83978);
    CutSpeakStringByStrRef(10.5, oParley, 83979);
    //Durnan will speak
    CutSpeakStringByStrRef(11.5, oDurnan, 83980);

    //Drow will summon gates and bring on attacking mobs
    DelayCommand(10.0,
        CutActionCastFakeSpellAtLocation(0.0, SPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW, GetObjectByTag("cut5_drowwiz1"), GetLocation(GetObjectByTag("cut5_drowwiz1"))));

    DelayCommand(13.0,
        CutActionCastFakeSpellAtLocation(0.0, SPELL_EARTHQUAKE, GetObjectByTag("cut5_drowwiz1"), GetLocation(GetObjectByTag("cut5_drowwiz1"))));

    //More attackers stream through the door

    CutCreateObject(14.0, oPC, OBJECT_TYPE_CREATURE, "cut1_dwarcleric1", lDrowStart1, VFX_NONE);
    DelayCommand(14.5,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut1_dwarcleric1"), lDrowAttack3, TRUE));
    DelayCommand(21.0, CutActionAttack(0.0, GetObjectByTag("cut1_dwarcleric1"), oLinu));

    //Wizard casts lightning to kill a few NPCs
    DelayCommand(15.5,
        CutActionCastFakeSpellAtObject(0.0, SPELL_ELECTRIC_JOLT, GetObjectByTag("cut5_drowwiz1"), oLaf));
    CutApplyEffectToObject(16.7, DURATION_TYPE_INSTANT, VFX_IMP_LIGHTNING_M, oLaf);
    CutApplyEffectToObject(16.9, DURATION_TYPE_INSTANT, VFX_IMP_LIGHTNING_M, oGlim);
    CutApplyEffectToObject(17.1, DURATION_TYPE_INSTANT, VFX_IMP_LIGHTNING_M, oParley);
    CutApplyEffectToObject2(17.8, DURATION_TYPE_INSTANT, EffectDeath(TRUE), oParley);
    CutApplyEffectToObject2(17.8, DURATION_TYPE_INSTANT, EffectDeath(TRUE), oGlim);
    CutApplyEffectToObject2(17.8, DURATION_TYPE_INSTANT, EffectDeath(TRUE), oLaf);
    CutPlaySound(16.9, oPC, "sim_exp2light", TRUE);
    //Another VFX spell cast
    DelayCommand(20.5,
        CutActionCastFakeSpellAtLocation(0.0, SPELL_PLANAR_ALLY, GetObjectByTag("cut5_drowwiz1"), GetLocation(GetObjectByTag("cut5_drowwiz1"))));

    //More attackers stream through the door
    CutCreateObject(19.0, oPC, OBJECT_TYPE_CREATURE, "cut1_dwizgen1", lDrowStart1, VFX_NONE);
    DelayCommand(19.5,
        CutActionMoveToLocation(0.0, GetObjectByTag("cut1_dwizgen1"), lDrowAttack5, TRUE));

    //Cast Darkness
    CutActionCastSpellAtObject(20.0, SPELL_DARKNESS, GetObjectByTag("cut5_drowwiz1"), oDurnan, METAMAGIC_ANY, TRUE);
    CutActionCastSpellAtObject(20.5, SPELL_DARKNESS, GetObjectByTag("cut5_drow1"), oGrayban, METAMAGIC_ANY, TRUE);
    CutActionCastSpellAtObject(20.4, SPELL_DARKNESS, GetObjectByTag("cut5_drow2"), oTamsil, METAMAGIC_ANY, TRUE);

    CutApplyEffectToObject(23.0, DURATION_TYPE_TEMPORARY, VFX_DUR_DARKNESS, oDurnan, 12.0, FALSE);
    CutApplyEffectToObject(23.4, DURATION_TYPE_TEMPORARY, VFX_DUR_DARKNESS, oTamsil, 12.0, FALSE);
    CutApplyEffectToObject(23.5, DURATION_TYPE_TEMPORARY, VFX_DUR_DARKNESS, oSharwyn, 12.0, FALSE);
    CutApplyEffectToObject(24.0, DURATION_TYPE_TEMPORARY, VFX_DUR_DARKNESS, oGrayban, 12.0, FALSE);

    //DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(), oDarkness, 12.0));
    //Adjust factions so the bad guys hate the good guys
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut5_drowwiz1"),STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut5_drow1"), STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut5_drow2"), STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut1_dwarcleric1"),STANDARD_FACTION_HOSTILE));
    //DelayCommand(24.5, ChangeToStandardFaction(oDwarWiz2, STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut1_dwizgen1"), STANDARD_FACTION_HOSTILE));
    //DelayCommand(24.5, ChangeToStandardFaction(oDwarCleric2,STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut1yp_dwar1"), STANDARD_FACTION_HOSTILE));
    DelayCommand(24.5, ChangeToStandardFaction(GetObjectByTag("cut1yp_dwar2"), STANDARD_FACTION_HOSTILE));

    //***KLUDGE TO FIX FACTION PROBLEM***

    DelayCommand(23.5, SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 100, oDurnan));
    DelayCommand(23.5, SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 100, oTamsil));


    CutActionEquipItem(22.5, oDaelan, GetItemPossessedBy(oDaelan, "NW_WDBMAX011"), INVENTORY_SLOT_RIGHTHAND, FALSE);
    CutActionEquipItem(22.5, oSharwyn, GetItemPossessedBy(oSharwyn, "NW_WDBMSW011"), INVENTORY_SLOT_RIGHTHAND, FALSE);


    CutDisableCutscene(nCutsceneNumberA, 23.2, 23.2, RESTORE_TYPE_COPY);


}
void HoldAllPlayers(object oPC)
{
    if(CutGetActiveCutsceneForObject(oPC) == nCutsceneNumberA)
    {
        object oCreature = GetFirstObjectInArea();
        while (oCreature != OBJECT_INVALID)
        {
            if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
            {
                if (GetTag(oCreature) != GetTag(oPC))
                {
                    if (GetTag(oCreature) != "cut5_drow1" && GetTag(oCreature) != "cut5_drow2" && GetTag(oCreature) != "cut5_drowwiz1" &&
                        GetTag(oCreature) != "cut1_dwarcleric1" && GetTag(oCreature) != "cut1_dwarcleric2" &&
                        GetTag(oCreature) != "cut1yp_dwar1" && GetTag(oCreature) != "cut1yp_dwar2" &&
                        GetTag(oCreature) != "cut1_dwizgen1" && GetTag(oCreature) != "cut1_dwizgen2")
                    {
                        CutApplyEffectToObject(0.0, DURATION_TYPE_TEMPORARY, SPELL_HOLD_MONSTER, oCreature, 14.5);
                        //CutPlayAnimation(0.0, oCreature, VFX_DUR_FREEZE_ANIMATION, 14.5, FALSE);
                    }
                }
            }
            oCreature = GetNextObjectInArea();
        }
    }
}

