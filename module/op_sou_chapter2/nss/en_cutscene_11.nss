//::///////////////////////////////////////////////
//:: Cutscene 11 (OnEnter)
//:: En_Cutscene_11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch Part II of the opening cutscene (#11)

    **UPDATE - April 11/03 - Keith Warner
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
#include "inc_cutscene_11"

void StartCutscene(object oPC);
void RemoveCutInvis(object oCreature);
void ReturnPlayers();
void FreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);
void UnFreezeAssociate(object oPlayers);
void JoinCutscene(object oPC);
void DestroyClone(object oClone);

void main()
{
    //Verify that it's a PC who's entering.
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        //Define the Cutscene Timer & Number
        float fTimer = 0.0;
        int CUTSCENE_NUMBER = 11;

        //Flag the player as being in Cutscene 11
        SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);

        //Set the Camera
        //Start with a black screen.
        BlackScreen(oPC);
        AssignCommand(oPC, SetCameraFacing(90.0));
        CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPC, TRUE, FALSE, TRUE);
        effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oPC);
        SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
        //If the cutscene is not currently active...
        int bCut_11_Active = GetLocalInt(GetModule(), "bCut_11_Active");
        if (bCut_11_Active == FALSE)
        {
            //Flag Cutscene 11 as now active
            SetLocalInt(GetModule(), "bCut_11_Active", TRUE);

            //Flag this player as being the Main PC for this cutscene.
            string sMainPC = "bMainPC_Cut"+IntToString(CUTSCENE_NUMBER);
            SetLocalInt(oPC, sMainPC, TRUE);

            StartCutscene(oPC);

        }

        //If the cutscene is currently active...
        else if (bCut_11_Active == TRUE)
        {

            JoinCutscene(oPC);

        }
    }
}

void StartCutscene(object oPC)
{
    int CUTSCENE_NUMBER = 11;
    float fTimer = 0.0;

    //Create a clone of the player.
    object oStatueSpawn = GetObjectByTag("Cut11_StatueJumpTarget");
    location lStatueSpawn = GetLocation(oStatueSpawn);
    object oClone = CopyObject(oPC, lStatueSpawn, OBJECT_INVALID, "Cut11_Clone");

    ChangeToStandardFaction(oClone, STANDARD_FACTION_COMMONER);
    //Petrify  the clones.
    effect ePetrify = EffectPetrify();

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePetrify, oClone);
    FreezeAssociate(oPC);

    //Cutscene Creatures
    object oAshtara = GetObjectByTag("Cut11_Ashtara");
    object oThrall_1 = GetObjectByTag("Cut11_Thrall_1");
    object oThrall_2 = GetObjectByTag("Cut11_Thrall_2");
    object oThrall_3 = GetObjectByTag("Cut11_Thrall_3");
    object oThrall_4 = GetObjectByTag("Cut11_Thrall_4");


    //Camera waypoints
    object oCameraInit = GetWaypointByTag("wp_cut11_camera_init");
    object oCamera1 = GetWaypointByTag("wp_cut11_camera_1");
    object oCamera2 = GetWaypointByTag("wp_cut11_camera_2");
    object oCamera3 = GetWaypointByTag("wp_cut11_camera_3");
    //Creature Movement Waypoints
    object oAshtara1 = GetWaypointByTag("wp_cut11_ashtara1");
    object oAshtara2 = GetWaypointByTag("Cut11_AshtaraStart");
    object oAshtara3 = GetWaypointByTag("Cut11_AshtaraEnd");
    //Set Initial Camera
    CutJumpToLocation(CUTSCENE_NUMBER, 1.0, oPC, GetLocation(oCameraInit), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, 1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    //Initial Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, 2.0, oPC, GetLocation(oCamera1), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, 2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 14.0, 50.0,
        CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //**********************************************************
    //Fade from black.
    fTimer = fTimer + 2.0;

    DelayCommand(fTimer, FadeFromBlack(oPC));

    //Start the text bubbles between Ashtara and the Thralls.

    fTimer = fTimer + 1.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oAshtara, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
//Line 1
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40170);
//
    fTimer = fTimer + 5.0;

    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_2, ANIMATION_LOOPING_TALK_PLEADING, 3.0);
//Line 2
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_2, 40171);
//
    fTimer = fTimer + 4.5;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_LOOPING_TALK_PLEADING, 3.0);
//Line 3
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_3, 40172);
//
    fTimer = fTimer + 3.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oAshtara, ANIMATION_LOOPING_TALK_LAUGHING, 3.0);
//Line 4
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40173);
//
    fTimer = fTimer + 4.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_LOOPING_WORSHIP, 6.0);
//Line 5
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer + 0.25, oThrall_3, 40174);
//
    fTimer = fTimer + 3.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oAshtara, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
//Line 6
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 0.25, oAshtara, 40175);
//
    fTimer = fTimer + 3.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_1, ANIMATION_FIREFORGET_SALUTE, 3.0);
//Line 7
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer + 1.25, oThrall_1, 40176);
//
    //Have the Thralls equip their hammers.
    DelayCommand(fTimer + 0.2, AssignCommand(oThrall_1, ActionEquipMostDamagingMelee()));
    DelayCommand(fTimer, AssignCommand(oThrall_2, ActionEquipMostDamagingMelee()));
    DelayCommand(fTimer + 0.7, AssignCommand(oThrall_3, ActionEquipMostDamagingMelee()));
    DelayCommand(fTimer + 0.5, AssignCommand(oThrall_4, ActionEquipMostDamagingMelee()));

    //Move the Thralls to the Bash Point.
    object oBashPoint = GetObjectByTag("Cut11_ThrallBash");
    fTimer = fTimer + 1.0;
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_1, oBashPoint, TRUE);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_2, oBashPoint, TRUE);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_3, oBashPoint, TRUE);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_4, oBashPoint, TRUE);

    //Second Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCamera2), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 14.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    //Make the Thralls bash the fallen debris.
    fTimer = fTimer + 3.0;
    DelayCommand(fTimer, Cut11_ThrallBash());

    CutSetFacingPoint(CUTSCENE_NUMBER, fTimer, oAshtara, "Cut11_Clone", FALSE);
    //Handle Ashtara's monologue up to the point she places the collar
    //on the PC.

    //Third Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCamera3), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 310.0, 8.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    fTimer = fTimer + 2.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oAshtara, ANIMATION_LOOPING_TALK_NORMAL, 3.0);
//Ashtara Line 1
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40177);
//
    fTimer = fTimer + 9.0;
//Ashtara Line 2
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40178);
//
    fTimer = fTimer + 7.0;
//Ashtara Line 3
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40179);
//
    fTimer = fTimer + 12.0;
//Ashtara Line 4
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40180);
//
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oAshtara, GetLocation(oAshtara1), FALSE);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+1.0, oAshtara, ANIMATION_LOOPING_GET_MID, 3.0);

    //Continue Ashtara's monologue up to the tremor.
    fTimer = fTimer + 11.5;
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oAshtara, GetLocation(oAshtara2), FALSE);
    CutSetFacingPoint(CUTSCENE_NUMBER, fTimer+0.5, oAshtara, "Cut11_Clone", FALSE);
//Ashtara Line 5
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40181);
//
    fTimer = fTimer + 10.5;
//Ashtara Line 6
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40182);
//
    fTimer = fTimer + 7.5;
//Ashtara line 7
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40183);
//
    //Third Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCamera3), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    //Finish Ashtara's monologue.
    fTimer = fTimer + 8.0;
//Ashtara line 8
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40184);
//
    fTimer = fTimer + 5.0;
//Ashtara Line 9
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oAshtara, 40185);
//
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer + 2.5, oAshtara, GetLocation(oAshtara3), FALSE);

    //Wrap up Cutscene 11 for all participating PCs.
    fTimer = fTimer + 6.5;
    DelayCommand(fTimer, Cut11_EndCutscene());

    //Jump the Thralls back to their starting positions.
    DelayCommand(fTimer, Cut11_ResetActors());

    //Destroy Clone of PC and henchman
    DelayCommand(fTimer + 2.0, DestroyClone(oClone));

    //Flag Cutscene 11 as no longer active.
    DelayCommand(fTimer, SetLocalInt(GetModule(), "bCut_11_Active", FALSE));

    //**********************************************************
    //End Cutscene Here


}

void ReturnPlayers()
{
    //activate the 2 Shadovar encounters
    object oEnc1 = GetObjectByTag("w04Shadovar1");
    object oEnc2 = GetObjectByTag("w04Shadovar2");
    SetEncounterActive(TRUE, oEnc1);
    SetEncounterActive(TRUE, oEnc2);

    //Destroy all remaining cutscene NPCs
    object oToDestroy = GetFirstObjectInArea(OBJECT_SELF);
    while (oToDestroy != OBJECT_INVALID)
    {
        if (GetTag(oToDestroy) == "cut20_shadowlich")
            DestroyObject(oToDestroy, 6.0);
        else if (GetStringLeft(GetTag(oToDestroy), 3) == "cut")
            DestroyObject(oToDestroy, 2.0);
        oToDestroy = GetNextObjectInArea(OBJECT_SELF);
    }
    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut20mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut20pcxreturn"));
    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 20;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {

            //AssignCommand(oPlayers, ClearAllActions());
            CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);

            if (GetLocalInt(oPlayers, "bMainPC_Cut20") == 1)
            {

                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lMainPC, FALSE);
            }
            else
            {
                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lPCX, FALSE);

            }
            DelayCommand(3.0, RemoveCutInvis(oPlayers));
            CutSetCutsceneMode(nCutsceneNumber, 3.0, oPlayers, FALSE);
            DelayCommand(5.0, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }

        oPlayers = GetNextPC();
    }
    SetLocalInt(GetModule(), "X1_CUT20RUNNING", 0);
}
void RemoveCutInvis(object oCreature)
{
    object oLich = GetObjectByTag("cut20_shadowlich");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oLich))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
    UnFreezeAssociate(oCreature);
}

void FreezeAssociate(object oPlayers)
{
    effect eAssociate = EffectCutsceneParalyze();
 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);
        }
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
        if (oDominated != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);
        }
}
void UnFreezeAssociate(object oPlayers)
{

 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oSummon);
        }
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
        if (oDominated != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oDominated);
        }
}
void RemoveAssociateEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetEffectType(eEff1) == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}

void JoinCutscene(object oPC)
{
    FadeFromBlack(oPC);

    //Jump the player to the observation point.
    object oViewPoint = GetObjectByTag("Cut11_Spectator");
    AssignCommand(oPC, JumpToObject(oViewPoint));
}

void DestroyClone(object oClone)
{
    DestroyObject(oClone);
}
