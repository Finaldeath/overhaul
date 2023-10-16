//::///////////////////////////////////////////////
//:: Name cutscene104
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This cutscene fires when the Inner Gates are
    Destroyed in Battle 1 - but only if destroyed
    by the Matron's forces - not the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 18/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"
#include "x0_i0_henchman"
#include "nw_i0_plot"

void StartCutscene(object oPC);
void ReturnPC(object oPC);
void MakeAreaNeutral(object oPC);
int PickVictoryAnimation();
float RandomDelay();

int nCutsceneNumber = 104;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oHerald = GetObjectByTag("q2aherald");
    object oPC = GetLocalObject(oHerald, "oLeader");

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
    AmbientSoundChangeDay(oArea, 35);
    AmbientSoundChangeNight(oArea, 35);
    AmbientSoundPlay(oArea);

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
       BlackScreen(oPlayer);

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
       CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

       CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }
    MakeAreaNeutral(oPC);

    DelayCommand(1.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{

    // Cutscene actors and objects.
    object oGateObject = GetObjectByTag("q2a_fakeinnergate");
    object oHerald = GetObjectByTag("q2aherald");

    CutSetActiveCutsceneForObject(oHerald, nCutsceneNumber);

    //Get the Duergar that destroyed the Gate (hopefully - or at least one of his buddies)
    object oDuergar1 = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oGateObject);
    SetImmortal(oDuergar1, TRUE);


    CutSetActiveCutsceneForObject(oDuergar1, nCutsceneNumber);

    //effects

    effect eDamage = EffectDeath();

    // Change the music
    //object oArea = GetObjectByTag("");
    //DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations


    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut104_pcstart"));
    object oCamera1 = GetWaypointByTag("wp_cut104_pcstart");
    location lCamera2 = GetLocation(GetWaypointByTag("cut104wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut104wp_camera3"));

    //Make a copy of the PC to move about
    object oStart = GetWaypointByTag("wp_cut104_copystart");
    object oCopyEnd = GetWaypointByTag("wp_cut104_copyend");
    location lStart = GetLocation(oStart);
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut104BattleCopy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    //CutSetCamera(9.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_FAST);

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

    //Destroy the Inner Gate in an Explosion
    object oGate1 = GetObjectByTag("q2ainnergate");

    if (GetIsObjectValid(oGate1) == TRUE)
    {
        SetPlotFlag(oGate1, FALSE);
        CutSetActiveCutsceneForObject(oGate1 , nCutsceneNumber);
        CutApplyEffectToObject(4.0, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, oGate1);
        CutApplyEffectToObject2(4.0, DURATION_TYPE_INSTANT, eDamage, oGate1);
    }


    //Henchmen leave
    CutActionMoveToLocation(2.0, oDuergar1, lCamera1, FALSE, FALSE);

    CutSpeakStringByStrRef(3.0, oDuergar1, 85736); //"The gates are broken. The way is clear!"

    //Herald and copy appear
    CutJumpToObject(1.0, oHerald, oStart, FALSE);
    CutActionMoveToLocation(2.0, oHerald, lCamera1, FALSE, FALSE);
    CutActionMoveToLocation(2.0, oCopy, lCamera1, TRUE, FALSE);

    //Copy freaks out
    CutSpeakStringByStrRef(4.0, oHerald, 85737); //"They've broken through!"
    CutSpeakStringByStrRef(8.0, oHerald, 85738);//"Hang on, we'll get you out of there."

    //PC is 'teleported' out
    CutApplyEffectToObject(10.0, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, oCopy);
    CutApplyEffectToObject(10.0, DURATION_TYPE_INSTANT, VFX_FNF_WORD, oCopy);

    //Fade to Black - return PC to the prelude to Battle 2 on the evil side.
    CutJumpToObject(11.0, oCopy, oCopyEnd, FALSE);

    // End Cutscene

    CutFadeOutAndIn(11.5, oPC);


    //Clean up actors...


    CutDisableCutscene(nCutsceneNumber, 13.5, 13.5, RESTORE_TYPE_NONE);


    DelayCommand(14.5, ReturnPC(oPC));
}

//Change all creatures in the Area to Neutral
//Good Creatures will run for the hills
//Evil Creatures will cheer
void MakeAreaNeutral(object oPC)
{

    object oArea = GetArea(oPC);
    object oPlayer = GetFirstPC();


    location lSpawn = GetLocation(GetWaypointByTag("wp_factionboys"));
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
                SetIsTemporaryFriend(oPC, oCreature, FALSE);
                AssignCommand(oCreature, ClearAllActions(TRUE));
                szTag = GetTag(oCreature);
                //Evil Creatures cheer (except the Seer and Tebomir)
                if (GetStringLeft(szTag, 8) == "q2a_bat1")
                {
                    nAnimation = PickVictoryAnimation();
                    AssignCommand(oCreature, ActionPlayAnimation(nAnimation));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(3.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(8.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                }
                //rebel troops
                else if (GetStringLeft(szTag, 7) == "q2abat1")
                {
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveAwayFromObject(oPC, TRUE)));
                    DestroyObject(oCreature, 5.0);
                }
            }
            //freeze henchmen
            else if (GetIsObjectValid(GetMaster(oCreature)) == TRUE)
                AssignCommand(oCreature, ClearAllActions(TRUE));
        }

        oCreature = GetNextObjectInArea(oArea);
    }
}

//Jump the PC to phase 2 of the siege
void ReturnPC(object oPC)
{
    object oHerald = GetObjectByTag("q2aherald");
    SetLocalInt(oHerald, "X2_Q2ABattle1Lost", 1);
    object oHeraldStart = GetWaypointByTag("wp_q2abattle2_herald_lossstart");
    AssignCommand(oHerald, JumpToObject(oHeraldStart));

    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC, "X2_Q2ABattle1Lost", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oTarget)));
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
