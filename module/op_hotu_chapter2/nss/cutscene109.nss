//::///////////////////////////////////////////////
//:: Name cutscene109
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Battle 2 - Wave 2 - Show Duergar forces moving into
    town and getting ready to attack...

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

int nCutsceneNumber = 109;

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
    int i = 1;
    effect eVis;
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
    object oGuard1 = GetObjectByTag("cut109_guard1");
    object oGuard2 = GetObjectByTag("cut109_guard2");

    object oBattleMage = GetObjectByTag("cut109_battlemage");
    object oDuergar1 = GetObjectByTag("cut109_duergar1");
    object oDuergar2 = GetObjectByTag("cut109_duergar2");
    object oDuergar3 = GetObjectByTag("cut109_duergar3");
    object oDuergar4 = GetObjectByTag("cut109_duergar4");
    object oDuergar5 = GetObjectByTag("cut109_duergar5");
    object oDuergar6 = GetObjectByTag("cut109_duergar6");

    object oBoneGolem = GetObjectByTag("cut109_bonegolem");

    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oBattleMage, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar5, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar6, nCutsceneNumber);

    if (GetIsObjectValid(oBoneGolem) == TRUE)
        CutSetActiveCutsceneForObject(oBoneGolem, nCutsceneNumber);

    //effects

    effect eDamage = EffectDeath();
    effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oBattleMage, BODY_NODE_HAND);
    effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oGuard1, BODY_NODE_CHEST);
    // Change the music
    //object oArea = GetObjectByTag("");
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations
    location lDefender1 = GetLocation(GetWaypointByTag("cut109wp_gateguard1"));
    location lDefender2 = GetLocation(GetWaypointByTag("cut109wp_gateguard2"));
    location lAttackSpawn = GetLocation(GetWaypointByTag("cut109wp_duergarspawn"));
    location lRunTo = GetLocation(GetWaypointByTag("wp_bat2_wave2_runto"));


    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut109wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut109wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut109wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut109wp_camera3"));

    //Make a copy of the PC to move about
    //location lStart = GetLocation(oPC);
    //object oCopy =  CutCreatePCCopy(oPC, lStart, "CutBattleCopy");
    //ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    //CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);

    CutSetCamera(7.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);



    CutActionMoveToLocation(2.0, oPC, lCamera2, FALSE, FALSE);
    CutActionMoveToLocation(17.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    CutJumpToLocation(0.0, oGuard1, lDefender1, FALSE);
    CutJumpToLocation(0.0, oGuard2, lDefender2, FALSE);
    //Destroy the Gate in an Explosion
    object oGate1 = GetObjectByTag("at_q2acitycore_environs");

    SetPlotFlag(oGate1, FALSE);
    CutSetActiveCutsceneForObject(oGate1 , nCutsceneNumber);
    CutApplyEffectToObject(4.0, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, oGate1);
    CutApplyEffectToObject2(4.0, DURATION_TYPE_INSTANT, eDamage, oGate1);

    //BattleMage appears
    CutJumpToLocation(4.5, oBattleMage, lAttackSpawn, FALSE);
    //Defenders rush towards the Gate
    CutPlayVoiceChat(5.0, oGuard1, VOICE_CHAT_ENEMIES);
    CutActionMoveToObject(5.5, oGuard1, oBattleMage, TRUE, FALSE);
    CutActionAttack(6.0, oGuard2, oBattleMage);

    //Duergar BattleMage wipes out defenders.
    CutActionCastFakeSpellAtObject(7.0, SPELL_BALL_LIGHTNING, oBattleMage, oGuard1);
    CutApplyEffectToObject2(10.0, DURATION_TYPE_TEMPORARY, eBeam1, oGuard1, 2.0);
    CutClearAllActions(10.0, oGuard1, TRUE, FALSE);
    CutPlayAnimation(10.0, oGuard1, ANIMATION_LOOPING_SPASM, 2.0, FALSE);
    AssignCommand(oBattleMaster, CutDeath(12.0, oGuard1, TRUE, FALSE));

    CutApplyEffectToObject2(11.0, DURATION_TYPE_TEMPORARY, eBeam2, oGuard2, 2.0);
    CutClearAllActions(11.0, oGuard2, TRUE, FALSE);
    CutPlayAnimation(11.0, oGuard1, ANIMATION_LOOPING_SPASM, 2.0, FALSE);
    AssignCommand(oBattleMaster, CutDeath(13.0, oGuard2, TRUE, FALSE));
    //Duergar troops stream into the city..
    CutPlayVoiceChat(14.0, oBattleMage, VOICE_CHAT_LAUGH);
    CutActionMoveToLocation(14.5, oBattleMage, lRunTo, TRUE, FALSE);

    CutJumpToLocation(15.0, oDuergar1, lAttackSpawn, FALSE);
    CutActionMoveToLocation(15.5, oDuergar1, lRunTo, TRUE, FALSE);
    CutJumpToLocation(16.0, oDuergar2, lAttackSpawn, FALSE);
    CutActionMoveToLocation(16.5, oDuergar2, lRunTo, TRUE, FALSE);
    CutJumpToLocation(17.0, oDuergar3, lAttackSpawn, FALSE);
    CutActionMoveToLocation(17.5, oDuergar3, lRunTo, TRUE, FALSE);
    CutJumpToLocation(18.0, oDuergar4, lAttackSpawn, FALSE);
    CutActionMoveToLocation(18.5, oDuergar4, lRunTo, TRUE, FALSE);
    CutJumpToLocation(19.0, oDuergar5, lAttackSpawn, FALSE);
    CutActionMoveToLocation(19.5, oDuergar5, lRunTo, TRUE, FALSE);
    CutJumpToLocation(20.0, oDuergar6, lAttackSpawn, FALSE);
    CutActionMoveToLocation(20.5, oDuergar6, lRunTo, TRUE, FALSE);

    if (GetIsObjectValid(oBoneGolem) == TRUE)
    {
        CutJumpToLocation(22.0, oBoneGolem, lAttackSpawn, FALSE);
        CutActionMoveToLocation(22.5, oDuergar6, lRunTo, TRUE, FALSE);
    }
    //Fade to Black - return PC square and start Wave 2 Battle


    // End Cutscene

    CutFadeOutAndIn(24.0, oPC);


    //Clean up Actors
    DelayCommand(24.5, RemoveCutsceneEffects());


    CutDestroyObject(25.0, oBattleMage);
    CutDestroyObject(25.0, oDuergar1);
    CutDestroyObject(25.0, oDuergar2);
    CutDestroyObject(25.0, oDuergar3);
    CutDestroyObject(25.0, oDuergar4);
    CutDestroyObject(25.0, oDuergar5);
    CutDestroyObject(25.0, oDuergar6);

    CutDestroyObject(25.0, oBoneGolem);

    CutDisableCutscene(nCutsceneNumber, 26.5, 26.5, RESTORE_TYPE_NORMAL);

    DelayCommand(28.5, ExecuteScript("bat2_wave2", oBattleMaster));

    //Reenable the Herald
    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(29.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    DelayCommand(29.5, SignalEvent(oHerald, EventUserDefined(101)));

}
void SpawnInCutsceneCreatures()
{
    location lHold = GetLocation(GetWaypointByTag("cut109wp_spawngather"));
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut109_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut109_guard2");

    CreateObject(OBJECT_TYPE_CREATURE, "cut109_duergar1", lHold, FALSE, "cut109_battlemage");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar1");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar2");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar3");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar4");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar5");
    CreateObject(OBJECT_TYPE_CREATURE, "cut101_duergar2", lHold, FALSE, "cut109_duergar6");

    if (GetGlobalInt("x2_plot_undead_out") == 0)
        CreateObject(OBJECT_TYPE_CREATURE, "cut101_undead3", lHold, FALSE, "cut109_bonegolem");

}
void RemoveCutsceneEffects()
{
    //Do nothing if cutscene has aborted
    if (GetLocalInt(GetModule(), "X2_Cutscene109Aborted") == 1)
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





