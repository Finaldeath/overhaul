//::///////////////////////////////////////////////
//:: Name cutscene113
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This cutscene fires when the Seer is killed
    during Battle 2 of the Siege.
    If the rebels were betrayed and the seer dies - the PC is victorious
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
void JumpPCToMatron();
int PickVictoryAnimation();
float RandomDelay();

int nCutsceneNumber = 113;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oBattleMaster = GetObjectByTag("q2abattle2master");
    object oPC = OBJECT_SELF;//GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oBattleMaster);//OBJECT_SELF;//GetLocalObject(oBattleMaster, "oPCForCut101");

    //Since this is the middle of a battle - lets make sure that the PC stays alive
    SetImmortal(oPC, TRUE);


    object oArea = GetArea(oPC);

    //Set Cutscene 113 as active for all future calls to Cut_ commands
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
       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

       CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, FALSE); // pc vis - keep associates

       CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }
    MakeAreaNeutral(oPC);

    DelayCommand(1.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{

    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("wp_bat2_seer");
    object oValen = GetObjectByTag("x2_hen_valen");
    object oNath = GetObjectByTag("x2_hen_nathyra");
    object oCopy = GetObjectByTag("Cut113Copy");

    if (GetIsObjectValid(oValen) == TRUE)
    {
        //AssignCommand(oValen, SetIsDestroyable(FALSE, FALSE, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oValen);
        CutSetActiveCutsceneForObject(oValen, nCutsceneNumber);
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oValen));
    }
    if (GetIsObjectValid(oNath) == TRUE)
    {
        AssignCommand(oNath, SetIsDestroyable(FALSE, FALSE, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oNath);
        CutSetActiveCutsceneForObject(oNath, nCutsceneNumber);
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oNath));
    }

    location lSpawn = GetLocation(GetWaypointByTag("cut112wp_factionstart"));
    //cutscene wizard
    object oWizard = CreateObject(OBJECT_TYPE_CREATURE, "cut101_drowwiz", lSpawn, FALSE, "cut113endwiz");

    CutSetActiveCutsceneForObject(oWizard, nCutsceneNumber);

    CutSetActiveCutsceneForObject(oSeer, nCutsceneNumber);

    //effects

    // Cutscene waypoint locations

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("wp_cut113_pcstart"));
    object oCamera1 = GetWaypointByTag("wp_cut113_pcstart");
    location lCamera2 = GetLocation(GetWaypointByTag("cut113wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut113wp_camera3"));

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 60.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 80.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //PC staggers over to Seer's body
    //CutPlayVoiceChat(1.0, oPC, VOICE_CHAT_YES, FALSE);
    CutActionMoveToObject(1.5, oPC, oSeer, FALSE, FALSE);
    AssignCommand(oCopy, ActionMoveToObject(oSeer, FALSE, 4.0));
    //PC does victory dance
    CutPlayAnimation(5.0, oCopy, ANIMATION_FIREFORGET_VICTORY2, 3.0, FALSE);
    CutPlayAnimation(9.5, oCopy, ANIMATION_FIREFORGET_VICTORY3, 3.0, FALSE);


    //Fade to Black - Jump PC to Matron's tower.
    // End Cutscene

    CutFadeOutAndIn(11.0, oPC);


    //Clean up actors...


    CutDisableCutscene(nCutsceneNumber, 13.0, 13.0, RESTORE_TYPE_NONE);


    DelayCommand(12.0, SetImmortal(oPC, FALSE));
    DelayCommand(13.5, JumpPCToMatron());
}

//Change all creatures in the Area to Neutral
//Good Creatures will run for the hills
//Evil Creatures will cheer
void MakeAreaNeutral(object oPC)
{

    location lStart = GetLocation(oPC);
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut113Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    object oArea = GetArea(oPC);
    object oPlayer = GetFirstPC();

    location lSpawn = GetLocation(GetWaypointByTag("cut113wp_factionboy"));
    object oFactionBoy = CreateObject(OBJECT_TYPE_CREATURE, "x2_factionboy", lSpawn);
    DestroyObject(oFactionBoy, 10.0);

    string szTag;
    int nAnimation;
    object oScatter;

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
                szTag = GetStringLeft(GetTag(oCreature), 8);
                //Evil Creatures cheer (except the Seer and Tebomir)
                if (szTag == "q2a_bat2" || szTag == "bat2_dro")
                {
                    nAnimation = PickVictoryAnimation();
                    AssignCommand(oCreature, ActionPlayAnimation(nAnimation));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(3.0 + RandomDelay(), AssignCommand(oCreature, ActionPlayAnimation(nAnimation)));
                    nAnimation = PickVictoryAnimation();
                    DelayCommand(8.0 + RandomDelay(), AssignCommand(oCreature, ActionMoveToObject(oPC, FALSE, 5.0)));
                }
                //else for the henchmen
                else if(szTag == "x2_hen_valen" || szTag == "x2_hen_nathyra" || szTag == "x2_hen_deekin")
                {
                    oScatter = GetNearestObjectByTag("wp_q2_bat2_rebelscatter", oCreature);
                    DelayCommand(1.0, AssignCommand(oCreature, ClearAllActions(TRUE)));
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveToObject(oScatter, TRUE)));
                    DestroyObject(oCreature, 5.0);
                }
                else if (GetIsObjectValid(GetMaster(oCreature)) == FALSE)
                {
                    oScatter = GetNearestObjectByTag("wp_q2_bat2_rebelscatter", oCreature);
                    DelayCommand(1.0, AssignCommand(oCreature, ClearAllActions(TRUE)));
                    DelayCommand(2.0, AssignCommand(oCreature, ActionMoveToObject(oScatter, TRUE)));
                    DestroyObject(oCreature, 5.0);
                }


            }
        }

        oCreature = GetNextObjectInArea(oArea);
    }
}
void JumpPCToMatron()
{
    /*
    Betray the rebels scenario:
    Set the module var “X2_ENDING_STATUS” to 1
    AND
    Jump the player to the following waypoint: “q7b_wp_camera1”
    */
    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 1);
    //Battle 2 Over variables
    //If Deekin is with the player when triggering the final cutscene then:
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oDeekin)) == TRUE)
            SetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE", 1);
    }
    // remove all other henchmen
    object oPC = GetFirstPC();
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        if(GetTag(oHench) != "x2_hen_deekin")
            DelayCommand(1.0, RemoveHenchman(oPC, oHench));
        else // Deekin
        {
           ForceRest(oDeekin);
            effect eEffect = GetFirstEffect(oDeekin);
            while (GetIsEffectValid(eEffect))
            {
                RemoveEffect(oDeekin, eEffect);
                eEffect = GetNextEffect(oDeekin);
            }
        }
        i++;
        oHench = GetHenchman(oPC, i);
    }


    object oTarget = GetObjectByTag("q7b_wp_camera1");
    //Remove immobalize (and polymorph) and jump PC to outside the Matron's fortress cutscene
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE ||
            GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }

    while (GetIsObjectValid(oPC) == TRUE)
    {
        ForceRest(oPC);
        DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oTarget)));
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
