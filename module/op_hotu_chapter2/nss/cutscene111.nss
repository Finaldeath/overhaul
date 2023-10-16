//::///////////////////////////////////////////////
//:: Name cutscene111
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This cutscene fires when the Seer is killed
    during the house maeviir battle.
    Turn everyone in the area neutral.
    Any remaining non-Maeviir's run away screaming
    House maeviir's celebrate good times.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 19/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"
#include "x0_i0_henchman"

void StartCutscene(object oPC);

void MakeAreaNeutral(object oPC);
//Now death of Seer is end of game..
void JumpPCToMatron();
int PickVictoryAnimation();
float RandomDelay();

int nCutsceneNumber = 111;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oBattleMaster = GetObjectByTag("q2abattle2master");
    object oPC = OBJECT_SELF;//GetLocalObject(oBattleMaster, "oPCForCut101");

    //Since this is the middle of a battle - lets make sure that the PC stays alive
    //(and his henchmen)
    SetImmortal(oPC, TRUE);
    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        SetImmortal(oHench, TRUE);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    object oArea = GetArea(oPC);


    //Change the ambient sound - battle is over
    //Change ambient sounds to battle sounds.
    //AmbientSoundChangeDay(oArea, 35);
    //AmbientSoundChangeNight(oArea, 35);
    //AmbientSoundPlay(oArea);

    //Set Cutscene 104 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
       AssignCommand(oPlayer, ClearAllActions());
       //Fade PCs to black
       //BlackScreen(oPlayer);

       //AssignCommand(oPlayer, ActionForceMoveToObject(oJumpTo));
       if(oPlayer == oPC)
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);

       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

       //CutDisableAbort(nCutsceneNumber);
       CutSetCutsceneMode(0.5, oPlayer, TRUE, FALSE, TRUE, FALSE); // pc vis - keep associates

       //CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }
    MakeAreaNeutral(oPC);

    DelayCommand(1.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{

    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("q2aseer");
    object oMatron = GetObjectByTag("q2amaematron");

    CutSetActiveCutsceneForObject(oSeer, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oMatron, nCutsceneNumber);

    //effects

    effect eKnockDown = EffectKnockdown();

    // Change the music
    //object oArea = GetObjectByTag("");
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations


    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut111_pcstart"));
    object oCamera1 = GetWaypointByTag("wp_cut111_pcstart");
    location lCamera2 = GetLocation(GetWaypointByTag("cut111wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut111wp_camera3"));

    //Make a copy of the PC to move about

   // location lStart = GetLocation(oStart);
   // object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut104BattleCopy");
   // ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
   // CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    //CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(17.5, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    //CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 75.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //CutActionMoveToLocation(6.5, oPC, GetLocation(oImloth), TRUE, FALSE);

    //CutActionMoveToLocation(12.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(20.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //PC staggers over to Seer's body
    CutPlayVoiceChat(1.0, oPC, VOICE_CHAT_NO, FALSE);
    CutActionMoveToObject(1.5, oPC, oSeer, FALSE, FALSE);
    //PC goes down to his knees
    CutPlayAnimation(5.0, oPC, ANIMATION_FIREFORGET_SALUTE, 3.0, FALSE);
    CutApplyEffectToObject(5.2, DURATION_TYPE_PERMANENT, VFX_DUR_FREEZE_ANIMATION, oPC);
    //Evil Matron walks over
    CutActionMoveToObject(3.0, oMatron, oPC, FALSE, FALSE);
    CutPlayVoiceChat(5.0, oMatron, VOICE_CHAT_LAUGH, FALSE);
    //Evil Matron casts on the PC
    CutSpeakStringByStrRef(6.0, oMatron, 85742, FALSE);  //"Thus all enemies of House Maeviir shall end."

    CutActionCastFakeSpellAtObject(9.0, SPELL_NEGATIVE_ENERGY_RAY, oMatron, oPC);

    CutApplyEffectToObject(13.0, DURATION_TYPE_PERMANENT, VFX_DUR_GLOBE_INVULNERABILITY, oPC);

    CutSpeakStringByStrRef(15.0, oMatron, 85743);  //"And now to end your meddling."

    //Fade to Black - Jump PC to Matron's tower.
    CutActionCastFakeSpellAtObject(17.0, SPELL_STONESKIN, oMatron, oPC);
    CutApplyEffectToObject(19.0, DURATION_TYPE_INSTANT, 464, oPC);
    //CutApplyEffectToObject(16.0, DURATION_TYPE_INSTANT, VFX_FNF_WORD, oPC);
    //CutApplyEffectToObject(16.0, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, oPC);
    // End Cutscene

    CutFadeOutAndIn(23.5, oPC);


    //Clean up actors...


    CutDisableCutscene(nCutsceneNumber, 24.5, 24.5, RESTORE_TYPE_NONE);


    DelayCommand(25.0, JumpPCToMatron());
}

//Change all creatures in the Area to Neutral
//Good Creatures will run for the hills
//Evil Creatures will cheer
void MakeAreaNeutral(object oPC)
{
    object oArea = GetArea(oPC);

    location lSpawn = GetLocation(GetWaypointByTag("cut108wp_copystart"));
    object oFactionBoy = CreateObject(OBJECT_TYPE_CREATURE, "x2_factionboy", lSpawn);

    DestroyObject(oFactionBoy, 10.0);

    string szTag;
    int nAnimation;
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        //Make sure its a creature
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            //But not the PC or a henchman
            if (GetIsPC(oCreature) == FALSE && GetAssociateType(oCreature) != ASSOCIATE_TYPE_HENCHMAN)
            {
                ChangeFaction(oCreature, oFactionBoy);
                AssignCommand(oCreature, ClearAllActions(TRUE));
                szTag = GetTag(oCreature);
                //Evil Creatures cheer (except the Seer and Tebomir)
                if (GetStringLeft(szTag, 8) == "cut108_g")
                {
                    nAnimation = PickVictoryAnimation();
                    AssignCommand(oCreature, ActionPlayAnimation(nAnimation));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(3.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(8.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                   }
                else if (GetStringLeft(szTag, 8) == "cut108_r")
                {
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveAwayFromObject(oPC, TRUE)));
                    DestroyObject(oCreature, 5.0);
                }
            }
        }

        oCreature = GetNextObjectInArea(oArea);
    }
}
//PC no longer jumps to Matron
//Death of the Seer is End of Game for the PC
void JumpPCToMatron()
{

    effect eDeath = EffectDeath();
    //object oTarget = GetObjectByTag("wp_q2a9_pcsiegeoffer");
    object oHench;
    int i;
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    while (GetIsObjectValid(oPC) == TRUE)
    {
        //AssignCommand(oPC, JumpToObject(oTarget));
        SetImmortal(oPC, FALSE);
        i = 1;
        oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            SetImmortal(oHench, FALSE);
            i++;
            oHench = GetHenchman(oPC, i);
        }

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oPC);
        //Pop up the Death Gui
        //PopUpDeathGUIPanel(oPC, FALSE , TRUE, 85568);
        oPC = GetNextPC();
    }


}
int PickVictoryAnimation()
{
    int nRandom = Random(3) + 1;
    int nAnimation;
    switch (nRandom)
    {
        case 1:    nAnimation = ANIMATION_FIREFORGET_VICTORY1;
                    break;
        case 2:    nAnimation = ANIMATION_FIREFORGET_VICTORY2;
                    break;
        case 3:    nAnimation = ANIMATION_FIREFORGET_VICTORY3;
                    break;
    }
    return nAnimation;
}
//Return a random delay up to 2.0 seconds
float RandomDelay()
{
    float fRandom = IntToFloat(Random(20)) / 10.0;
    return fRandom;

}
