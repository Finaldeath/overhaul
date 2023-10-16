//::///////////////////////////////////////////////
//:: Name cutscene103
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    PC has betrayed the rebels by destroying the inner gate.
    The matron's troops storm into the city

*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 5/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"
#include "x0_i0_henchman"
#include "nw_i0_plot"

void StartCutscene(object oPC);
void ReturnPC(object oPC);
void CleanUpArea();
void SpawnInCutsceneCreatures();

int nCutsceneNumber = 103;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oPC = OBJECT_SELF;
    object oArea = GetArea(oPC);

    object oDeva = GetObjectByTag("q2dlavoera");
    object oGolem1 = GetObjectByTag("q2a_bat_fleshgol");
    object oGolem2 = GetObjectByTag("q2a_bat_silvgol");

    DestroyObject(oDeva);
    DestroyObject(oGolem1);
    DestroyObject(oGolem2);
    //this cutscene could possibly have been triggered after the summoning cutscene(105)
    //has started - need to cancel out of that cutscene and show this one.
    if (GetActiveCutsceneNum() == 105)
        CutDisableCutscene(105, 0.0, 0.0, RESTORE_TYPE_NONE);

    //Change the ambient sound - battle is over
    //Change ambient sounds to battle sounds.
    AmbientSoundChangeDay(oArea, 35);
    AmbientSoundChangeNight(oArea, 35);
    AmbientSoundPlay(oArea);

    SetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed", 1);

    //Set Cutscene 103 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
       AssignCommand(oPlayer, ClearAllActions());
       //Fade PCs to black
       BlackScreen(oPlayer);

       if(oPlayer == oPC)
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
            if (GetLocalInt(oPlayer, "Q2A_OnLedge") == 1)
            {
                object oJumpTo = GetWaypointByTag("wp_cut103_pcledgejump");
                AssignCommand(oPlayer, JumpToObject(oJumpTo));
            }
       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

       CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

       CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }
    CleanUpArea();
    DelayCommand(0.5, SpawnInCutsceneCreatures());
    DelayCommand(2.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    //Check for the Drow Henchmen - they will leave the party and teleport to the seer for battle 2.

    // Cutscene actors and objects.
    object oDuergar1_1 = GetObjectByTag("cut103_duergar1_1");
    object oDuergar1_2 = GetObjectByTag("cut103_duergar1_2");
    object oDuergar1_3 = GetObjectByTag("cut103_duergar1_3");
    object oDuergar1_4 = GetObjectByTag("cut103_duergar1_4");
    object oDuergar1_5 = GetObjectByTag("cut103_duergar1_5");

    object oDuergar2_1 = GetObjectByTag("cut103_duergar2_1");
    object oDuergar2_2 = GetObjectByTag("cut103_duergar2_2");
    object oDuergar2_3 = GetObjectByTag("cut103_duergar2_3");
    object oDuergar2_4 = GetObjectByTag("cut103_duergar2_4");
    object oDuergar2_5 = GetObjectByTag("cut103_duergar2_5");

    object oDrowPriest1 = GetObjectByTag("cut103_drowpriest");

    object oReb1 = GetObjectByTag("cut103_reb1_1");
    object oReb2 = GetObjectByTag("cut103_reb1_2");
    object oReb3 = GetObjectByTag("cut103_reb1_3");
    object oReb4 = GetObjectByTag("cut103_reb1_4");
    object oReb5 = GetObjectByTag("cut103_reb2_1");
    object oReb6 = GetObjectByTag("cut103_reb2_2");
    object oReb7 = GetObjectByTag("cut103_reb2_3");
    object oReb8 = GetObjectByTag("cut103_reb2_4");
    object oFist = GetObjectByTag("cut103_fist");
    DestroyObject(oFist, 30.0);

    object oImloth = GetObjectByTag("q2aherald");
    SetPlotFlag(oImloth, FALSE);
    SetImmortal(oImloth, FALSE);
    object oBackupTarget = GetWaypointByTag("wp_cut103_backuptarget");
    //take care of the henchmen
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oValen = GetObjectByTag("x2_hen_valen");

    object oMaster1 = GetMaster(oNathyrra);
    if (GetIsObjectValid(oMaster1) == TRUE)
    {
        FireHenchman(oMaster1, oNathyrra);
        ChangeToStandardFaction(oNathyrra, STANDARD_FACTION_COMMONER);
    }
    object oMaster2 = GetMaster(oValen);
    if (GetIsObjectValid(oMaster2) == TRUE)
    {
        FireHenchman(oMaster2, oValen);
        ChangeToStandardFaction(oValen, STANDARD_FACTION_COMMONER);
    }
    AssignCommand(oNathyrra, SetIsDestroyable(TRUE));
    AssignCommand(oValen, SetIsDestroyable(TRUE));
    //effects

    effect eDamage = EffectDeath();

    // Change the music
    //object oArea = GetObjectByTag("");
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations
    location lAttack1 = GetLocation(GetWaypointByTag("cut103wp_attack_1"));
    location lAttack2 = GetLocation(GetWaypointByTag("cut103wp_attack_2"));
    location lAttack3 = GetLocation(GetWaypointByTag("cut103wp_attack_3"));
    location lAttack4 = GetLocation(GetWaypointByTag("cut103wp_attack_4"));


    location lAttack5 = GetLocation(GetWaypointByTag("cut103wp_attack_5"));
    location lAttack6 = GetLocation(GetWaypointByTag("cut103wp_attack_6"));
    location lAttack7 = GetLocation(GetWaypointByTag("cut103wp_attack_7"));
    location lAttack8 = GetLocation(GetWaypointByTag("cut103wp_attack_8"));

    location lPriest1_1 = GetLocation(GetWaypointByTag("cut103wp_priest1_1"));

    location lCopy1 = GetLocation(GetWaypointByTag("cut103wp_copy1"));

    location lRebRetreat1 = GetLocation(GetWaypointByTag("cut103wp_retreat1"));
    location lRebRetreat2 = GetLocation(GetWaypointByTag("cut103wp_retreat2"));

    location lHenchRetreat = GetLocation(GetWaypointByTag("cut103wp_henchretreat"));

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut103wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut103wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut103wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut103wp_camera3"));

    //Make a copy of the PC to move about
    location lStart = GetLocation(oPC);
    object oCopy =  CutCreatePCCopy(oPC, lStart, "CutBattleCopy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    if (GetIsObjectValid(oImloth) == TRUE && GetDistanceBetween(oImloth, oCopy) < 20.0)
    {
        CutActionMoveToLocation(0.0, oImloth, lCopy1, TRUE);
        CutActionMoveToObject(1.0, oCopy, oImloth, FALSE);
    }
    else
    {
        CutActionMoveToObject(1.0, oCopy, oBackupTarget, FALSE);
    }
    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 80.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    //CutSetCamera(6.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 80.0,
    //             CAMERA_TRANSITION_TYPE_FAST);

    CutSetCamera(12.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 60.0,
    //            CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //if (GetIsObjectValid(oImloth) == TRUE)
    //{
    //    CutActionMoveToLocation(3.5, oPC, GetLocation(oImloth), FALSE, FALSE);
    //}
    //else
    //{
    CutActionMoveToObject(3.5, oPC, oBackupTarget, FALSE);
    //}
    //CutActionMoveToLocation(3.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(20.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Destroy the Inner Gate in an Explosion
    object oGate1 = GetObjectByTag("q2ainnergate");
    object oGate2 = GetObjectByTag("q2acitygate");
    //Don't destroy the gate if the PC picked it and openned it
    if (GetLocalInt(GetModule(), "X2_InnerGatePicked") == 0)
    {
        if (GetIsObjectValid(oGate1) == TRUE)
        {
            SetPlotFlag(oGate1, FALSE);
            CutSetActiveCutsceneForObject(oGate1 , nCutsceneNumber);
            CutApplyEffectToObject(4.0, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, oGate1);
            CutApplyEffectToObject2(4.0, DURATION_TYPE_INSTANT, eDamage, oGate1);
        }
    }
    //Outer Gates are destroyed (if they still exist)
    if (GetIsObjectValid(oGate2) == TRUE)
    {
        SetPlotFlag(oGate2, FALSE);
        CutSetActiveCutsceneForObject(oGate2 , nCutsceneNumber);
        CutApplyEffectToObject(10.0, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, oGate2);
        CutApplyEffectToObject2(10.0, DURATION_TYPE_INSTANT, eDamage, oGate2);
    }

    //Protests by the defenders
    CutSpeakStringByStrRef(6.0, oImloth, 85731 ); //"What have you done?"
    CutSpeakStringByStrRef(4.5, oNathyrra, 85732);//"Traitor!"
    CutSpeakStringByStrRef(7.0, oValen, 85733);//"You've doomed us all!"

    //Henchmen leave
    CutActionMoveToLocation(6.0, oNathyrra, lHenchRetreat, TRUE, FALSE);
    CutActionMoveToLocation(8.5, oValen, lHenchRetreat, TRUE, FALSE);

    CutDestroyObject(15.0, oNathyrra);
    CutDestroyObject(15.0, oValen);

    SetImmortal(oImloth, FALSE);

    CutActionAttack(14.0, oCopy, oImloth);
    AssignCommand(oImloth, CutApplyEffectToObject2(11.0, DURATION_TYPE_INSTANT, EffectDeath(), oImloth));

    //Magic kills some defenders.
    CutActionCastSpellAtObject(14.0, SPELL_ISAACS_LESSER_MISSILE_STORM, oDrowPriest1, oReb5, METAMAGIC_ANY, TRUE);

    //Matron's army streams in
    CutActionAttack(10.0, oDuergar1_1, oReb1);
    CutActionAttack(11.0, oDuergar1_2, oReb2);
    CutActionAttack(12.0, oDuergar1_3, oReb3);
    CutActionAttack(13.0, oDuergar1_4, oReb4);
    CutActionAttack(14.0, oDuergar1_5, oReb5);
    CutActionAttack(10.0, oDuergar2_1, oReb6);
    CutActionAttack(11.0, oDuergar2_2, oReb7);
    CutActionAttack(12.0, oDuergar2_3, oReb8);
    CutActionAttack(13.0, oDuergar2_4, oReb3);
    CutActionAttack(14.0, oDuergar2_5, oReb6);

    CutActionAttack(12.0, oReb1, oDuergar1_1);
    CutActionAttack(12.0, oReb3, oDuergar1_2);
    CutActionAttack(12.0, oReb5, oDuergar2_3);
    CutActionAttack(12.0, oReb7, oDuergar2_4);
    CutActionAttack(12.0, oReb8, oDuergar1_5);

    CutSpeakStringByStrRef(12.0, oReb2, 85734); //"We are betrayed!"
    CutActionMoveToLocation(12.0, oReb2, lRebRetreat1, TRUE);

    CutSpeakStringByStrRef(13.0, oReb4, 85735);//"Fall back! Save the Seer!"
    CutActionMoveToLocation(13.0, oReb2, lRebRetreat1, TRUE);

    //PC Cheers
    CutPlayAnimation(20.0, oCopy, ANIMATION_FIREFORGET_VICTORY2, 3.0);

    //More defenders killed.

    //Matron's commander comes in
    CutActionForceMoveToObject(17.0, oDrowPriest1, oCopy, FALSE, 2.0, 10.0);


    //Fade to Black - return PC to the prelude to Battle 2 on the evil side.


    // End Cutscene

    CutFadeOutAndIn(30.0, oPC);


    //Clean up actors...
    CutDeath(31.0, oReb1, FALSE);
    CutDeath(31.0, oReb2, FALSE);
    CutDeath(31.0, oReb3, FALSE);
    CutDeath(31.0, oReb4, FALSE);
    CutDeath(31.0, oReb5, FALSE);
    CutDeath(31.0, oReb6, FALSE);
    CutDeath(31.0, oReb7, FALSE);
    CutDeath(31.0, oReb8, FALSE);
    CutDeath(31.0, oImloth, FALSE);
    CutDeath(31.0, oFist, FALSE);
    location lRebSpawn1_1 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_2"));
    location lRebSpawn1_2 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_3"));
    location lRebSpawn1_3 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_4"));
    location lRebSpawn1_4 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_5"));
    location lSquadLead1 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_1"));
    location lSquadLead2 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_1"));
    location lRebSpawn2_1 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_2"));
    location lRebSpawn2_2 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_3"));
    location lRebSpawn2_3 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_4"));
    location lRebSpawn2_4 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_5"));

    CutJumpToLocation(31.5, oDuergar1_2, lRebSpawn1_1);
    CutJumpToLocation(31.5, oDuergar1_3, lRebSpawn1_2);
    CutJumpToLocation(31.5, oDuergar1_4, lRebSpawn1_3);
    CutJumpToLocation(31.5, oDuergar1_5, lRebSpawn1_4);
    CutJumpToLocation(31.5, oDuergar1_1, lSquadLead1);
    CutJumpToLocation(31.5, oDuergar2_1, lSquadLead2);
    CutJumpToLocation(31.5, oDuergar2_2, lRebSpawn2_1);
    CutJumpToLocation(31.5, oDuergar2_3, lRebSpawn2_2);
    CutJumpToLocation(31.5, oDuergar2_4, lRebSpawn2_3);
    CutJumpToLocation(31.5, oDuergar2_5, lRebSpawn2_4);

    CutDisableCutscene(nCutsceneNumber, 35.0, 35.0, RESTORE_TYPE_NONE);


    DelayCommand(33.0, ReturnPC(oPC));


}


void ReturnPC(object oPC)
{
    object oPriest =  GetObjectByTag("cut103_drowpriest");
    if (IsInConversation(oPriest) == FALSE)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);
        AssignCommand(oPriest, ActionStartConversation(oPC, "bat1_betrayconv"));
    }
    //Set area friendly to PC
    object oArea = GetArea(oPC);
    object oFirst = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oFirst) == TRUE)
    {
        if (GetObjectType(oFirst) == OBJECT_TYPE_CREATURE)
        {
            SetIsTemporaryFriend(oPC, oFirst);
        }
        oFirst = GetNextObjectInArea(oArea);
    }
}

//Destroy All creatures in the area (except henchmen)
void CleanUpArea()
{
    object oArea = GetObjectByTag("q2a_city1");

    object oCreature = GetFirstObjectInArea(oArea);
    while (oCreature != OBJECT_INVALID)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetIsObjectValid(GetMaster(oCreature)) == FALSE && GetTag(oCreature) != "q2aherald")
            {
                DestroyObject(oCreature);
            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}

//Spawn in all needed creatures for cutscene 103
void SpawnInCutsceneCreatures()
{
    //LOCATIONS
    object oDrowSpawn1_1 = GetWaypointByTag("cut103wp_drowspawn1_1");
    object oDrowSpawn1_2 = GetWaypointByTag("cut103wp_drowspawn1_2");
    object oDrowSpawn1_3 = GetWaypointByTag("cut103wp_drowspawn1_3");
    object oDrowSpawn1_4 = GetWaypointByTag("cut103wp_drowspawn1_4");
    object oDrowSpawn1_5 = GetWaypointByTag("cut103wp_drowspawn1_5");

    object oDrowSpawn2_1 = GetWaypointByTag("cut103wp_drowspawn2_1");
    object oDrowSpawn2_2 = GetWaypointByTag("cut103wp_drowspawn2_2");
    object oDrowSpawn2_3 = GetWaypointByTag("cut103wp_drowspawn2_3");
    object oDrowSpawn2_4 = GetWaypointByTag("cut103wp_drowspawn2_4");
    object oDrowSpawn2_5 = GetWaypointByTag("cut103wp_drowspawn2_5");

    location lDrowSpawnPriest = GetLocation(GetWaypointByTag("cut103wp_drowspawn_priest"));

    location lFistShaker = GetLocation(GetWaypointByTag("cut103wp_fistshaker"));

    object oRebSpawn1_1 = GetWaypointByTag("wp_bat1_rebmoveto1_2");
    object oRebSpawn1_2 = GetWaypointByTag("wp_bat1_rebmoveto1_3");
    object oRebSpawn1_3 = GetWaypointByTag("wp_bat1_rebmoveto1_4");
    object oRebSpawn1_4 = GetWaypointByTag("wp_bat1_rebmoveto1_5");

    object oRebSpawn2_1 = GetWaypointByTag("wp_bat1_rebmoveto2_2");
    object oRebSpawn2_2 = GetWaypointByTag("wp_bat1_rebmoveto2_3");
    object oRebSpawn2_3 = GetWaypointByTag("wp_bat1_rebmoveto2_4");
    object oRebSpawn2_4 = GetWaypointByTag("wp_bat1_rebmoveto2_5");

    //Faction Creatures
    object oFaction1 = GetObjectByTag("q2_faction1boy");
    object oFaction2 = GetObjectByTag("q2_faction2boy");
    //NPCs needed for cutscene 103.
    //Imloth (the Battle Herald
    object oImloth = GetObjectByTag("q2aherald");
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oValen = GetObjectByTag("x2_hen_valen");
    AssignCommand(oImloth, ClearAllActions());

    object oFist = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lFistShaker, FALSE, "cut103_fist");
    AssignCommand(oFist, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 40.0));
    /*
    object oRebel1 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn1_1, FALSE, "cut103_reb1_1");
    object oRebel2 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn1_2, FALSE, "cut103_reb1_2");
    object oRebel3 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn1_3, FALSE, "cut103_reb1_3");
    object oRebel4 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn1_4, FALSE, "cut103_reb1_4");

    object oRebel5 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn2_1, FALSE, "cut103_reb2_1");
    object oRebel6 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn2_2, FALSE, "cut103_reb2_2");
    object oRebel7 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn2_3, FALSE, "cut103_reb2_3");
    object oRebel8 = CreateObject(OBJECT_TYPE_CREATURE, "cut103_reb1", lRebSpawn2_4, FALSE, "cut103_reb2_4");
    */
    object oRebel1 = GetObjectByTag("cut103_reb1_1");
    object oRebel2 = GetObjectByTag("cut103_reb1_2");
    object oRebel3 = GetObjectByTag("cut103_reb1_3");
    object oRebel4 = GetObjectByTag("cut103_reb1_4");
    object oRebel5 = GetObjectByTag("cut103_reb2_1");
    object oRebel6 = GetObjectByTag("cut103_reb2_2");
    object oRebel7 = GetObjectByTag("cut103_reb2_3");
    object oRebel8 = GetObjectByTag("cut103_reb2_4");
    AssignCommand(oRebel1, JumpToObject(oRebSpawn1_1));
    AssignCommand(oRebel2, JumpToObject(oRebSpawn1_2));
    AssignCommand(oRebel3, JumpToObject(oRebSpawn1_3));
    AssignCommand(oRebel4, JumpToObject(oRebSpawn1_4));
    AssignCommand(oRebel5, JumpToObject(oRebSpawn2_1));
    AssignCommand(oRebel6, JumpToObject(oRebSpawn2_2));
    AssignCommand(oRebel7, JumpToObject(oRebSpawn2_3));
    AssignCommand(oRebel8, JumpToObject(oRebSpawn2_4));
    ChangeFaction(oRebel1, oFaction1);
    ChangeFaction(oRebel2, oFaction1);
    ChangeFaction(oRebel3, oFaction1);
    ChangeFaction(oRebel4, oFaction1);
    ChangeFaction(oRebel5, oFaction1);
    ChangeFaction(oRebel6, oFaction1);
    ChangeFaction(oRebel7, oFaction1);
    ChangeFaction(oRebel8, oFaction1);

    //Drow Battle Priest
    object oPriest = CreateObject(OBJECT_TYPE_CREATURE, "cut101_drowpries", lDrowSpawnPriest, FALSE, "cut103_drowpriest");
    ChangeFaction(oPriest, oFaction2);

    //Drow Commander???

    //Drow Troops.
    //object oDuergar1_1 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar1", lDrowSpawn1_1, FALSE, "cut103_duergar1_1");
    object oDuergar1_1 = GetObjectByTag("cut103_duergar1_1");
    AssignCommand(oDuergar1_1, JumpToObject(oDrowSpawn1_1));
    ChangeFaction(oDuergar1_1, oFaction2);
    //object oDuergar1_2 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar1", lDrowSpawn1_2, FALSE, "cut103_duergar1_2");
    object oDuergar1_2 = GetObjectByTag("cut103_duergar1_2");
    AssignCommand(oDuergar1_2, JumpToObject(oDrowSpawn1_2));
    ChangeFaction(oDuergar1_2, oFaction2);
    //object oDuergar1_3 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar1", lDrowSpawn1_3, FALSE, "cut103_duergar1_3");
    object oDuergar1_3 = GetObjectByTag("cut103_duergar1_3");
    AssignCommand(oDuergar1_3, JumpToObject(oDrowSpawn1_3));
    ChangeFaction(oDuergar1_3, oFaction2);
    //object oDuergar1_4 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar1", lDrowSpawn1_4, FALSE, "cut103_duergar1_4");
    object oDuergar1_4 = GetObjectByTag("cut103_duergar1_4");
    AssignCommand(oDuergar1_4, JumpToObject(oDrowSpawn1_4));
    ChangeFaction(oDuergar1_4, oFaction2);
    //object oDuergar1_5 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar1", lDrowSpawn1_5, FALSE, "cut103_duergar1_5");
    object oDuergar1_5 = GetObjectByTag("cut103_duergar1_5");
    AssignCommand(oDuergar1_5, JumpToObject(oDrowSpawn1_5));
    ChangeFaction(oDuergar1_5, oFaction2);

    //object oDuergar2_1 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lDrowSpawn2_1, FALSE, "cut103_duergar2_1");
    object oDuergar2_1 = GetObjectByTag("cut103_duergar2_1");
    AssignCommand(oDuergar2_1, JumpToObject(oDrowSpawn2_1));
    ChangeFaction(oDuergar2_1, oFaction2);
    //object oDuergar2_2 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lDrowSpawn2_2, FALSE, "cut103_duergar2_2");
    object oDuergar2_2 = GetObjectByTag("cut103_duergar2_2");
    AssignCommand(oDuergar2_2, JumpToObject(oDrowSpawn2_2));
    ChangeFaction(oDuergar2_2, oFaction2);
    //object oDuergar2_3 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lDrowSpawn2_3, FALSE, "cut103_duergar2_3");
    object oDuergar2_3 = GetObjectByTag("cut103_duergar2_3");
    AssignCommand(oDuergar2_3, JumpToObject(oDrowSpawn2_3));
    ChangeFaction(oDuergar2_3, oFaction2);
    //object oDuergar2_4 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lDrowSpawn2_4, FALSE, "cut103_duergar2_4");
    object oDuergar2_4 = GetObjectByTag("cut103_duergar2_4");
    AssignCommand(oDuergar2_4, JumpToObject(oDrowSpawn2_4));
    ChangeFaction(oDuergar2_4, oFaction2);
    //object oDuergar2_5 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lDrowSpawn2_5, FALSE, "cut103_duergar2_5");
    object oDuergar2_5 = GetObjectByTag("cut103_duergar2_5");
    AssignCommand(oDuergar2_5, JumpToObject(oDrowSpawn2_5));
    ChangeFaction(oDuergar2_5, oFaction2);

    //Set Active Cutscene for all NPCS
    CutSetActiveCutsceneForObject(oImloth , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel5 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel6 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel7 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oRebel8 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDuergar1_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_5 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oPriest , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oImloth, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oNathyrra, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oValen, nCutsceneNumber);

    //OPTIONAL BIT IF MATRON STILL HAS UNDEAD IN HER ARMY
    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        //Create an undead battle group
        location lUndead1_1 = GetLocation(GetWaypointByTag("cut103wp_undeadspawn1_1"));
        location lUndead1_2 = GetLocation(GetWaypointByTag("cut103wp_undeadspawn1_2"));

        object oUndead1_1 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_undead4", lUndead1_1, FALSE, "cut103_undead1_1");
        object oUndead1_2 = CreateObject(OBJECT_TYPE_CREATURE, "cut101_undead4", lUndead1_2, FALSE, "cut103_undead1_2");

        CutSetActiveCutsceneForObject(oUndead1_1 , nCutsceneNumber);
        CutSetActiveCutsceneForObject(oUndead1_2 , nCutsceneNumber);



    }

}



