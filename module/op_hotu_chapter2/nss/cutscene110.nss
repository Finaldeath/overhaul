//::///////////////////////////////////////////////
//:: Name cutscene110
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Battle 2 - Wave 3 - Show Drow forces moving into
    town from the Port and getting ready to attack...

*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Sept 11/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"


void StartCutscene(object oPC);
void SpawnInCutsceneCreatures();
void RemoveCutsceneEffects();

int nCutsceneNumber = 110;

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


    //Set Cutscene 110 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black and

    //Set Cutscene mode on each player in the area and do the fade
    object oHench1, oHench2;
    int i;
    effect eVis;
    object oHench;
    object oPlayer = GetFirstPC();
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
        //CutDisableAbort(nCutsceneNumber);
        CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

        //Make Each Henchmen Parlyzed
        i = 1;
        eVis;
        oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            //CutSetActiveCutsceneForObject(oHench, nCutsceneNumber, FALSE);
            //CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oHench);
            i++;
            oHench = GetHenchman(oPC, i);
        }


        CutSetLocation(0.6, oPlayer, FALSE);

        CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_MEDIUM, FALSE);

        oPlayer = GetNextPC();
    }
    DelayCommand(0.5, SpawnInCutsceneCreatures());
    DelayCommand(1.0, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    /*int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oHench , nCutsceneNumber);
        i++;
        oHench = GetHenchman(oPC, i);
    }
    */

    //Make sure the Seer is back at her spot
    object oSeer = GetObjectByTag("q2aseer");
    AssignCommand(oSeer, ClearAllActions());
    object oSeerPost = GetObjectByTag("wp_bat2_seer");
    AssignCommand(oSeer, ActionJumpToObject(oSeerPost));

    DelayCommand(2.0, AssignCommand(oSeer, ClearAllActions()));

    object oBattleMaster = GetObjectByTag("q2abattle2master");
    // Cutscene actors and objects.
    object oGuard1 = GetObjectByTag("cut110_guard1");
    object oGuard2 = GetObjectByTag("cut110_guard2");

    object oBattleMage = GetObjectByTag("cut110_drowmage");
    object oDrow1 = GetObjectByTag("cut110_drow1");
    object oDrow2 = GetObjectByTag("cut110_drow2");
    object oDrow3 = GetObjectByTag("cut110_drow3");
    object oDrow4 = GetObjectByTag("cut110_drow4");
    object oDrow5 = GetObjectByTag("cut110_drow5");
    object oDrow6 = GetObjectByTag("cut110_drow6");

    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oBattleMage, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow5, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow6, nCutsceneNumber);

    //effects

    //***do not do this***  Creating the effect here, since the PC is running the script, will
    //make NPCs think the PC is applying this effect
    //effect eDamage = EffectDeath();

    //sounds
    string szWaterLap = "as_na_waterlap2";
    string szBigSplash = "as_na_splash1";
    string szLittleSplash = "as_na_splash2";

    // Change the music
    //object oArea = GetObjectByTag("");
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations
    location lDefender1 = GetLocation(GetWaypointByTag("cut110wp_gateguard1"));
    location lDefender2 = GetLocation(GetWaypointByTag("cut110wp_gateguard2"));
    location lAttackSpawn = GetLocation(GetWaypointByTag("cut110wp_drowspawn"));
    location lMoveTo = GetLocation(GetWaypointByTag("wp_bat2_wave3_moveto"));

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut110wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut110wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut110wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut110wp_camera3"));

    //Make a copy of the PC to move about
    //location lStart = GetLocation(oPC);
    //object oCopy =  CutCreatePCCopy(oPC, lStart, "CutBattleCopy");
    //ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    //CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 350.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 20.0, 5.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(13.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 60.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);



    CutActionMoveToLocation(6.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(20.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////
    CutJumpToLocation(0.0, oGuard1, lDefender1, FALSE);
    CutJumpToLocation(0.0, oGuard2, lDefender2, FALSE);

    //Play Sound
    CutPlaySound(0.3, oPC, szWaterLap, FALSE);

    //Guards speak
    CutSpeakStringByStrRef(1.0, oGuard1, 85740, FALSE); //"Did you hear that?"

    //BattleMage appears
    CutPlaySound(4.0, oPC, szBigSplash, FALSE);
    CutPlaySound(4.3, oPC, szLittleSplash, FALSE);
    CutPlaySound(4.6, oPC, szBigSplash, FALSE);
    CutJumpToLocation(4.5, oBattleMage, lAttackSpawn, FALSE);
    //Defenders rush towards the Gate
    CutSpeakStringByStrRef(5.5, oGuard2, 85741, FALSE); //"They've come from the river. How?"
    CutActionMoveToObject(5.8, oGuard1, oBattleMage, TRUE, FALSE);
    CutActionAttack(6.2, oGuard2, oBattleMage);

    //Drow BattleMage wipes out defenders.
    CutActionCastFakeSpellAtObject(7.0, SPELL_BALL_LIGHTNING, oBattleMage, oGuard1);
    CutApplyEffectToObject(10.0, DURATION_TYPE_INSTANT, VFX_FNF_ELECTRIC_EXPLOSION, oGuard1, 2.0);
    CutClearAllActions(10.0, oGuard1, TRUE, FALSE);
    CutPlayAnimation(10.0, oGuard1, ANIMATION_LOOPING_SPASM, 2.0, FALSE);
    AssignCommand(oBattleMaster, CutDeath(11.0, oGuard1, TRUE, FALSE));

    CutApplyEffectToObject(11.0, DURATION_TYPE_INSTANT, VFX_FNF_ELECTRIC_EXPLOSION, oGuard2, 2.0);
    CutClearAllActions(11.0, oGuard2, TRUE, FALSE);
    CutPlayAnimation(11.0, oGuard1, ANIMATION_LOOPING_SPASM, 2.0, FALSE);
    AssignCommand(oBattleMaster, CutDeath(12.0, oGuard2, TRUE, FALSE));
    //Duergar troops stream into the city..
    CutPlayVoiceChat(14.0, oBattleMage, VOICE_CHAT_LAUGH);
    CutActionMoveToLocation(14.5, oBattleMage, lMoveTo, TRUE, FALSE);

    CutJumpToLocation(16.0, oDrow1, lAttackSpawn, FALSE);
    CutActionMoveToLocation(16.5, oDrow1, lMoveTo, TRUE, FALSE);
    CutJumpToLocation(17.0, oDrow2, lAttackSpawn, FALSE);
    CutActionMoveToLocation(17.5, oDrow2, lMoveTo, TRUE, FALSE);
    CutJumpToLocation(18.0, oDrow3, lAttackSpawn, FALSE);
    CutActionMoveToLocation(18.5, oDrow3, lMoveTo, TRUE, FALSE);
    CutJumpToLocation(19.0, oDrow4, lAttackSpawn, FALSE);
    CutActionMoveToLocation(19.5, oDrow4, lMoveTo, TRUE, FALSE);
    CutJumpToLocation(20.0, oDrow5, lAttackSpawn, FALSE);
    CutActionMoveToLocation(20.5, oDrow5, lMoveTo, TRUE, FALSE);
    CutJumpToLocation(21.0, oDrow6, lAttackSpawn, FALSE);
    CutActionMoveToLocation(21.5, oDrow6, lMoveTo, TRUE, FALSE);


    //Fade to Black - return PC square and start Wave 2 Battle


    // End Cutscene

    CutFadeOutAndIn(23.0, oPC);


    //Clean up Actors

    DelayCommand(23.5, RemoveCutsceneEffects());


    CutDestroyObject(23.5, oBattleMage);
    CutDestroyObject(23.5, oDrow1);
    CutDestroyObject(23.5, oDrow2);
    CutDestroyObject(23.5, oDrow3);
    CutDestroyObject(23.5, oDrow4);
    CutDestroyObject(23.5, oDrow5);
    CutDestroyObject(23.5, oDrow6);



    CutDisableCutscene(nCutsceneNumber, 24.5, 24.5, RESTORE_TYPE_NORMAL);

    DelayCommand(25.0, ExecuteScript("bat2_wave3", oBattleMaster));

    //Reenable the Herald
    //object oHerald = GetObjectByTag("q2aherald");
    //DelayCommand(26.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    //DelayCommand(26.5, SignalEvent(oHerald, EventUserDefined(101)));

}
void SpawnInCutsceneCreatures()
{
    location lHold = GetLocation(GetWaypointByTag("cut109wp_spawngather"));
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut110_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut110_guard2");

    CreateObject(OBJECT_TYPE_CREATURE, "cut101_drowwiz", lHold, FALSE, "cut110_drowmage");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow2", lHold, FALSE, "cut110_drow1");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow2", lHold, FALSE, "cut110_drow2");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow2", lHold, FALSE, "cut110_drow3");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow1", lHold, FALSE, "cut110_drow4");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow1", lHold, FALSE, "cut110_drow5");
    CreateObject(OBJECT_TYPE_CREATURE, "cut110_drow1", lHold, FALSE, "cut110_drow6");


}

//Grab each PCs henchmen and remove the cutscene paralyze effect from them
void RemoveCutsceneEffects()
{
    //Do nothing if cutscene has aborted
    if (GetLocalInt(GetModule(), "X2_Cutscene110Aborted") == 1)
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


