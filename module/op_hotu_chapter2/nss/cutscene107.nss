//::///////////////////////////////////////////////
//:: Name cutscene107
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Battle 2 - Wave 4 - Attack of the Beholders

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

int nCutsceneNumber = 107;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    //PC Should be the one executing this script
    object oPC = OBJECT_SELF;
    int i;
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
    //Set Cutscene 107 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black and

    //Set Cutscene mode on each player in the area and do the fade
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
    //DEBUG
    AssignCommand(oSeer, ClearAllActions());

    object oBattleMaster = GetObjectByTag("q2abattle2master");
    // Cutscene actors and objects.
    object oGuard1 = GetObjectByTag("cut107_guard1");
    object oGuard2 = GetObjectByTag("cut107_guard2");

    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBattleMaster, nCutsceneNumber);

    // Cutscene waypoint locations
    location lDefender1 = GetLocation(GetWaypointByTag("cut107wp_gateguard1"));
    location lDefender2 = GetLocation(GetWaypointByTag("cut107wp_gateguard2"));
    location lAttackSpawn1 = GetLocation(GetWaypointByTag("cut107wp_beholderspawn1"));
    location lAttackSpawn2 = GetLocation(GetWaypointByTag("cut107wp_beholderspawn2"));

    //effects

    effect eDamage = EffectDeath();
    effect eFlyIn1 = EffectDisappearAppear(lAttackSpawn1);
    effect eFlyIn2 = EffectDisappearAppear(lAttackSpawn2);

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut107wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut107wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut107wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut107wp_camera3"));


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 250.0, 15.0, 60.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //CutSetCamera(7.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 85.0,
    //             CAMERA_TRANSITION_TYPE_SLOW);
    //CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);



    CutActionMoveToLocation(16.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(17.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Jump Guards to start locations
    CutJumpToLocation(0.0, oGuard1, lDefender1, FALSE);
    CutJumpToLocation(0.0, oGuard2, lDefender2, FALSE);
    //Guards walk up to each other
    CutActionMoveToObject(1.0, oGuard1, oGuard2, FALSE, FALSE);
    CutActionMoveToObject(1.0, oGuard2, oGuard1, FALSE, FALSE);
    //Watch a couple guards chatting
    CutSpeakStringByStrRef(5.0, oGuard1, 85739);//"I think the worst of it is over."
    //Several Beholders 'fly' in.
    CutCreateObject(9.0, oPC, OBJECT_TYPE_CREATURE, "cut107_beholder1", lAttackSpawn1, FALSE);
    CutCreateObject(9.4, oPC, OBJECT_TYPE_CREATURE, "cut107_beholder2", lAttackSpawn2, FALSE);
    DelayCommand(11.0, ChangeToStandardFaction(GetObjectByTag("cut107_beholder1"), STANDARD_FACTION_HOSTILE));
    DelayCommand(11.0, ChangeToStandardFaction(GetObjectByTag("cut107_beholder2"), STANDARD_FACTION_HOSTILE));
    //Guards are roasted.
    CutSetFacingPoint(9.5, oGuard1, "cut107_beholder1", FALSE);
    CutSetFacingPoint(9.7, oGuard2, "cut107_beholder2", FALSE);

    DelayCommand(10.0, CutActionAttack(0.0, oGuard1, GetObjectByTag("cut107_beholder1")));
    DelayCommand(10.0, CutActionAttack(0.0, oGuard2, GetObjectByTag("cut107_beholder2")));
    CutPlayVoiceChat(10.0, oGuard2, VOICE_CHAT_CUSS, FALSE);

    //non-cutscene commands are fine since aborting scene kills beholder.
      DelayCommand(13.65, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(776, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.75, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(776, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.85, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(777, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.95, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(778, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(14.05, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(779, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(14.15, AssignCommand(GetObjectByTag("cut107_beholder1"), ActionCastSpellAtObject(780, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));

      DelayCommand(13.65, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(776, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.75, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(777, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.85, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(778, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(13.95, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(779, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(14.05, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(780, oGuard2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
      DelayCommand(14.15, AssignCommand(GetObjectByTag("cut107_beholder2"), ActionCastSpellAtObject(776, oGuard1, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));


    DelayCommand(14.2, AssignCommand(GetObjectByTag("cut107_beholder2"), CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, EffectDeath(), oGuard1)));
    DelayCommand(14.3, AssignCommand(GetObjectByTag("cut107_beholder1"), CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, EffectDeath(), oGuard2)));
    //Beholders fly off
    DelayCommand(16.0, CutActionMoveToObject(0.0, GetObjectByTag("cut107_beholder1"), oSeer, FALSE));
    DelayCommand(17.0, CutActionMoveToObject(0.0, GetObjectByTag("cut107_beholder2"), oSeer, FALSE));

    //Fade to Black - return PC square and start Wave 2 Battle


    // End Cutscene

    CutFadeOutAndIn(22.0, oPC);


    //Clean up Actors
    DelayCommand(22.5, RemoveCutsceneEffects());

    DelayCommand(22.5, CutDestroyObject(0.0, GetObjectByTag("cut107_beholder1")));
    DelayCommand(22.5, CutDestroyObject(0.0, GetObjectByTag("cut107_beholder2")));

    CutDisableCutscene(nCutsceneNumber, 23.0, 23.0, RESTORE_TYPE_NORMAL);

    //If the matron has mindflayer's as well - jump to the Mindflayer cutscene
    if (GetGlobalInt("X2_Q2DOvermind") < 2)
        DelayCommand(25.0, ExecuteScript("cutscene106", oPC));
    //else start the Wave 4 attack
    else
        DelayCommand(25.0, ExecuteScript("bat2_wave4", oBattleMaster));

    //Reenable the Herald
    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(26.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    DelayCommand(26.5, SignalEvent(oHerald, EventUserDefined(101)));

}
void SpawnInCutsceneCreatures()
{
    location lHold = GetLocation(GetWaypointByTag("cut109wp_spawngather"));
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut107_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, "bat2cut_guard", lHold, FALSE, "cut107_guard2");

}

void RemoveCutsceneEffects()
{
    //Do nothing if cutscene has aborted
    if (GetLocalInt(GetModule(), "X2_Cutscene107Aborted") == 1)
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




