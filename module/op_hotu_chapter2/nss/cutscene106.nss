//::///////////////////////////////////////////////
//:: Name cutscene106
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Battle 2 - Wave 4 - Attack of the Mindflayers

*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Sept 11/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"

void SpawnInCutsceneCreatures();
void StartCutscene(object oPC);
void RemoveCutsceneEffects();

int nCutsceneNumber = 106;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    //PC Should be the one executing this script
    object oPC = OBJECT_SELF;

    //Make sure the Wisp does not follow the player
    object oHerald = GetObjectByTag("q2aherald");
    SetLocalInt(oHerald, "nDoNotFollow", 1);

    object oArea = GetArea(oPC);

    //Change the ambient sound - battle is over
    AmbientSoundChangeDay(oArea, 35);
    AmbientSoundChangeNight(oArea, 35);
    AmbientSoundPlay(oArea);
    //Change ambient sounds to battle sounds.
    DelayCommand(4.0, AmbientSoundChangeDay(oArea, 27));
    DelayCommand(4.0, AmbientSoundChangeNight(oArea, 27));
    DelayCommand(4.0, AmbientSoundPlay(oArea));
    DelayCommand(4.0, MusicBattlePlay(oArea));
    //Set Cutscene 109 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black and

    //Set Cutscene mode on each player in the area and do the fade
    object oHench;
    object oPlayer = GetFirstPC();
    int i = 1;
    effect eVis;
    while (oPlayer != OBJECT_INVALID)
    {
       AssignCommand(oPlayer, ClearAllActions());
       //Fade PCs to black
       BlackScreen(oPlayer);

       if(oPlayer == oPC)
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);

       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

        CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

        //Make Each Henchmen Parlyzed
        i = 1;
        oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oHench);
            i++;
            oHench = GetHenchman(oPC, i);
        }

        CutSetLocation(0.6, oPlayer, FALSE);

        CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FAST, FALSE);

        oPlayer = GetNextPC();
    }

    DelayCommand(0.5, SpawnInCutsceneCreatures());
    DelayCommand(1.0, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    object oSeer = GetObjectByTag("q2aseer");

    AssignCommand(oSeer, ClearAllActions());

    object oBattleMaster = GetObjectByTag("q2abattle2master");
    // Cutscene actors and objects.
    object oGuard1 = GetObjectByTag("cut106_guard1");
    object oGuard2 = GetObjectByTag("cut106_guard2");

    object oUmber1 = GetObjectByTag("cut106_mf1");
    object oUmber2 = GetObjectByTag("cut106_mf2");
    object oUmber3 = GetObjectByTag("cut106_mf3");

    object oMindflayer1 = GetObjectByTag("cut106_mf4");
    object oMindflayer2 = GetObjectByTag("cut106_mf5");


    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oUmber1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oUmber2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oUmber3, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oMindflayer1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMindflayer2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBattleMaster, nCutsceneNumber);
    //effects

    //effect eDamage = EffectDeath();

    // Cutscene waypoint locations
    location lDefender1 = GetLocation(GetWaypointByTag("cut106wp_gateguard1"));
    location lDefender2 = GetLocation(GetWaypointByTag("cut106wp_gateguard2"));
    location lAttackSpawn1 = GetLocation(GetWaypointByTag("cut106wp_umberspawn1"));
    location lAttackSpawn2 = GetLocation(GetWaypointByTag("cut106wp_umberspawn2"));
    location lAttackSpawn3 = GetLocation(GetWaypointByTag("cut106wp_umberspawn3"));

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut106wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut106wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut106wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut106wp_camera3"));



    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 70.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    //CutSetCamera(7.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);



    CutActionMoveToLocation(14.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(17.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    CutJumpToLocation(0.0, oGuard1, lDefender1, FALSE);
    CutJumpToLocation(0.0, oGuard2, lDefender2, FALSE);
    //Watch a couple guards chatting
    CutSpeakStringByStrRef(2.0, oGuard2, 85763, FALSE); //"I didn't think we would make it through, brother."
    CutPlayAnimation(5.0, oGuard1, ANIMATION_FIREFORGET_GREETING, 1.0, FALSE);
    //One Umber Hulk bursts from ground with Rock Effect.
    CutApplyEffectAtLocation(6.0, oUmber1, DURATION_TYPE_INSTANT, 354, lAttackSpawn1);
    CutApplyEffectAtLocation(6.5, oUmber1, DURATION_TYPE_INSTANT, 354, lAttackSpawn1);
    CutApplyEffectAtLocation(7.0, oUmber1, DURATION_TYPE_INSTANT, 354, lAttackSpawn1);

    CutCreateObject(6.0, oUmber1, OBJECT_TYPE_PLACEABLE, "x2_plc_hole_b", lAttackSpawn1, FALSE);
    CutJumpToLocation(7.0, oUmber1, lAttackSpawn1, FALSE);

    //Guards face umber
    DelayCommand(7.5, TurnToFaceObject(oUmber1, oGuard1));
    DelayCommand(7.7, TurnToFaceObject(oUmber1, oGuard2));

    //Umber chargers
    CutActionMoveToObject(8.0, oUmber1, oGuard1, FALSE, FALSE);

    //Guards fight and kill the Umber Hulk
    CutPlayVoiceChat(8.0, oGuard2, VOICE_CHAT_ENEMIES, FALSE);
    CutActionAttack(8.5, oGuard1, oUmber1);
    CutActionAttack(8.0, oGuard2, oUmber1);
    AssignCommand(oBattleMaster, CutDeath(10.0, oUmber1, FALSE, FALSE));

    //Two more Hulks burst forth
    CutApplyEffectAtLocation(10.5, oUmber2, DURATION_TYPE_INSTANT, 354, lAttackSpawn2);
    CutApplyEffectAtLocation(11.0, oUmber2, DURATION_TYPE_INSTANT, 354, lAttackSpawn2);
    CutApplyEffectAtLocation(11.5, oUmber2, DURATION_TYPE_INSTANT, 354, lAttackSpawn2);

    CutCreateObject(10.5, oUmber2, OBJECT_TYPE_PLACEABLE, "x2_plc_hole_b", lAttackSpawn2, FALSE);
    CutJumpToLocation(12.0, oUmber2, lAttackSpawn2, FALSE);

    CutApplyEffectAtLocation(10.9, oUmber3, DURATION_TYPE_INSTANT, 354, lAttackSpawn3);
    CutApplyEffectAtLocation(11.4, oUmber3, DURATION_TYPE_INSTANT, 354, lAttackSpawn3);
    CutApplyEffectAtLocation(11.9, oUmber3, DURATION_TYPE_INSTANT, 354, lAttackSpawn3);
    CutCreateObject(10.9, oUmber3, OBJECT_TYPE_PLACEABLE, "x2_plc_hole_b", lAttackSpawn3, FALSE);
    CutJumpToLocation(12.9, oUmber3, lAttackSpawn3, FALSE);
    //Use MindBlast on the Guards
    CutActionCastFakeSpellAtObject(14.0, 693, oUmber2, oGuard1);
    CutActionCastFakeSpellAtObject(14.5, 693, oUmber3, oGuard2);

    //Guards are roasted.
    AssignCommand(oBattleMaster, CutDeath(15.5, oGuard1, TRUE, FALSE));
    AssignCommand(oBattleMaster, CutDeath(16.0, oGuard2, TRUE, FALSE));

    //Hulks leave
    CutActionMoveToObject(17.8, oUmber2, oSeer, FALSE);
    CutActionMoveToObject(18.2, oUmber3, oSeer, FALSE);

    //Mindflayers appear
    CutJumpToLocation(21.9, oMindflayer1, lAttackSpawn1, FALSE);
    CutJumpToLocation(22.9, oMindflayer2, lAttackSpawn2, FALSE);
    //and stalk off

    CutActionMoveToObject(26.8, oMindflayer1, oSeer, FALSE);
    CutActionMoveToObject(27.2, oMindflayer2, oSeer, FALSE);

    //Fade to Black - return PC square and start Wave 2 Battle


    // End Cutscene

    CutFadeOutAndIn(32.0, oPC);


    //Clean up Actors
    DelayCommand(32.5, RemoveCutsceneEffects());


    CutDestroyObject(33.5, oUmber1);
    CutDestroyObject(33.5, oUmber2);
    CutDestroyObject(33.5, oUmber3);
    CutDestroyObject(33.5, oMindflayer1);
    CutDestroyObject(33.5, oMindflayer2);



    CutDisableCutscene(nCutsceneNumber, 34.0, 34.0, RESTORE_TYPE_NORMAL);

    //start the Wave 4 attack
    DelayCommand(35.5, ExecuteScript("bat2_wave4", oBattleMaster));

    //Reenable the Herald
    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(36.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    DelayCommand(36.5, SignalEvent(oHerald, EventUserDefined(101)));

}
void SpawnInCutsceneCreatures()
{
    location lHold = GetLocation(GetWaypointByTag("cut106wp_spawngather"));
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut106_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut106_guard2");


    CreateObject(OBJECT_TYPE_CREATURE, "cut106_mf2", lHold, FALSE, "cut106_mf1");
    CreateObject(OBJECT_TYPE_CREATURE, "cut106_mf2", lHold, FALSE, "cut106_mf2");
    CreateObject(OBJECT_TYPE_CREATURE, "cut106_mf2", lHold, FALSE, "cut106_mf3");
    CreateObject(OBJECT_TYPE_CREATURE, "cut106_mf1", lHold, FALSE, "cut106_mf4");
    CreateObject(OBJECT_TYPE_CREATURE, "cut106_mf1", lHold, FALSE, "cut106_mf5");


}


void RemoveCutsceneEffects()
{
    //Do nothing if cutscene has aborted
    if (GetLocalInt(GetModule(), "X2_Cutscene106Aborted") == 1)
        return;

    int nCount;
    object oHench;
    effect eEffect;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC) == TRUE)
    {
        nCount = 1;
        oHench = GetHenchman(oPC, nCount);
        while (GetIsObjectValid(oHench) == TRUE)
        {
            eEffect = GetFirstEffect(oHench);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENE_PARALYZE)
                    RemoveEffect(oHench, eEffect);

                eEffect = GetNextEffect(oHench);
            }
            nCount = nCount + 1;
            oHench = GetHenchman(oPC, nCount);
        }
        oPC = GetNextPC();
    }


}



