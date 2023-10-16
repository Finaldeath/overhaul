//::///////////////////////////////////////////////
//:: Cutscene 10 (OnEnter)
//:: En_Cutscene_10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch the opening cutscene (#10)
     **UPDATE** April 10 / 03 - Keith Warner
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 1, 2003
//:://////////////////////////////////////////////
#include "inc_cutscene_10"

void StartCutscene(object oPC);
void FreezeAssociate(object oPlayers);
void JoinCutscene(object oPC);
void DestroyClone(object oClone);
void RemoveOldItems(object oPC);
int IsInvalidItem(object oItem);

void main()
{
    object oPC = GetEnteringObject();
    //DMs entering will skip the cutscene..
    if (GetIsDM(oPC) == TRUE)
    {
        object oJumpTarget = GetObjectByTag("Undrentide_StartLoc");
        AssignCommand(oPC, JumpToObject(oJumpTarget));
        return;
    }
    //Verify that it's a PC who's entering.

    if (GetIsPC(oPC) == TRUE)
    {
        RemoveOldItems(oPC);
        FreezeAssociate(oPC);
        //If the cutscene is not currently active...
        int bCut_10_Active = GetLocalInt(GetModule(), "bCut_10_Active");
        if (bCut_10_Active == FALSE)
        {
            //Flag Cutscene 10 as now active
            SetLocalInt(GetModule(), "bCut_10_Active", TRUE);

            //Define the Cutscene Timer & Number
            float fTimer = 0.0;
            int iCutNum = 10;

            //Flag the player as being in Cutscene 10
//            CutSetCutsceneMode(iCutNum, fTimer, oPC, TRUE);
            SetCutsceneMode(oPC, TRUE);
            SetLocalInt(oPC, "nCutsceneNumber", iCutNum);

            //Flag this player as being the Main PC for this cutscene.
            string sMainPC = "bMainPC_Cut"+IntToString(iCutNum);
            SetLocalInt(oPC, sMainPC, TRUE);

            //Start with a black screen.
//            CutBlackScreen(iCutNum, 0.0, oPC);
            BlackScreen(oPC);

            effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oPC);

            StartCutscene(oPC);
        }
        //If the cutscene is currently active...
        else if (bCut_10_Active == TRUE)
        {
            //Flag the player as being in Cutscene 10
            SetCutsceneMode(oPC, TRUE);
            SetLocalInt(oPC, "nCutsceneNumber", 10);

            //Make the player invisible.
            effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oPC);
            JoinCutscene(oPC);

        }
    }
}

void StartCutscene(object oPC)
{
    //Define the Cutscene Timer & Number
    int CUTSCENE_NUMBER = 10;
    float fTimer = 0.0;
    //Create a clone of the player.
    object oStatueSpawn = GetObjectByTag("Cut10_StatueSpawn");
    location lStatueSpawn = GetLocation(oStatueSpawn);
    object oClone = CopyObject(oPC, lStatueSpawn, OBJECT_INVALID, "Cut10_Clone");
    object oFactionHolder = GetObjectByTag("Cut10_FactionHolder");
    ChangeToStandardFaction(oClone, STANDARD_FACTION_COMMONER);

    //Petrify  the clone.
    effect ePetrify = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePetrify, oClone);

    //Fade from black.
    CutFadeFromBlack(CUTSCENE_NUMBER, 1.0, oPC, FALSE, FADE_SPEED_SLOWEST);
//            FadeFromBlack(oPC, FADE_SPEED_SLOWEST);

    //Camera locations
    object oCameraInit = GetWaypointByTag("wp_cut10_camera_init");
    object oCamera1 = GetWaypointByTag("wp_cut10_camera_1");
    object oCamera2 = GetWaypointByTag("wp_cut10_camera_2");

    //Set Initial Camera
    CutJumpToLocation(CUTSCENE_NUMBER, 1.0, oPC, GetLocation(oCameraInit), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, 1.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 40.0,
        CAMERA_TRANSITION_TYPE_SNAP);
    //Initial Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, 2.0, oPC, GetLocation(oCamera1), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, 2.0, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 17.0, 50.0,
        CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //Move the Thralls toward the clone.
    object oThrall_1 = GetObjectByTag("Cut10_Thrall_1");
    object oThrall_2 = GetObjectByTag("Cut10_Thrall_2");
    object oThrall_3 = GetObjectByTag("Cut10_Thrall_3");
    object oThrall_4 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 1);
    object oThrall_5 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 2);
    object oThrall_6 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 3);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_1, oClone, FALSE, TRUE, 1.5);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_2, oClone, FALSE, TRUE, 1.5);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_3, oClone, FALSE, TRUE, 2.5);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_4, oClone, FALSE, TRUE, 4.5);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_5, oClone, FALSE, TRUE, 4.5);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_6, oClone, FALSE, TRUE, 4.5);

    //Second Camera Movement
    CutSetCamera(CUTSCENE_NUMBER, fTimer + 4.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 12.0, 50.0,
              CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //When the Thralls arrive, start their text bubbles up to the first
    //tremor.
    fTimer = fTimer + 9.0;
//LINE 1
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 4.0, oThrall_1, 40160);
//
    fTimer = fTimer + 2.0;
//LINE 2
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_2, 40161);
//
    fTimer = fTimer + 6.0;
//LINE 3
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 2.0, oThrall_3, 40162);
//
    //Play the first tremor.
    vector vStatueSpawn = GetPositionFromLocation(lStatueSpawn);
    vector vTremor = Vector(vStatueSpawn.x, vStatueSpawn.y, vStatueSpawn.z + 10.0);
    location lTremor = Location(OBJECT_SELF, vTremor, 0.0);
    effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
    effect eDebris = EffectVisualEffect(353);
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBump, oPC));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));

    //Third Camera Movement
    //CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCamera2), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer - 3.0, oPC, CAMERA_MODE_TOP_DOWN, 245.0, 14.0, 50.0,
                CAMERA_TRANSITION_TYPE_CRAWL);

    //Continue the Thralls' text bubbles up to the second tremor.
    fTimer = fTimer + 6.0;
//Line 4
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 3.5, oThrall_1, 40163);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_1, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 3.0);
    //Other Thralls Animations
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_4, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+1.0, oThrall_5, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+0.5, oThrall_6, ANIMATION_FIREFORGET_DRINK, 3.0);

    fTimer = fTimer + 1.5;
//Line 5
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_3, 40164);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_FIREFORGET_TAUNT, 3.0);
    //Other Thralls Animations
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_4, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+1.0, oThrall_2, ANIMATION_LOOPING_LOOK_FAR, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+0.5, oThrall_5, ANIMATION_LOOPING_PAUSE_TIRED, 3.0);

    fTimer = fTimer + 3.5;
    CutSetFacingPoint(CUTSCENE_NUMBER, fTimer, oThrall_1, GetTag(oThrall_3), FALSE);
//Line 6
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_1, 40165);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_1, ANIMATION_FIREFORGET_TAUNT, 3.0);
    //Other Thralls Animations
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_2, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+1.0, oThrall_6, ANIMATION_LOOPING_LOOK_FAR, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+0.5, oThrall_4, ANIMATION_LOOPING_PAUSE_TIRED, 3.0);

    fTimer = fTimer + 4.0;
//Line 7
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer, oThrall_3, 40166);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
    //Other Thralls Animations
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_4, ANIMATION_FIREFORGET_READ, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+1.0, oThrall_5, ANIMATION_LOOPING_LOOK_FAR, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer+0.5, oThrall_6, ANIMATION_LOOPING_LISTEN, 3.0);

    //Third Camera Movement
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 7.0, 50.0,
               CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //Play the second tremor.
    effect eShake = EffectVisualEffect(356);
    fTimer = fTimer + 2.0;
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oPC, 30.0));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    fTimer = fTimer + 0.5;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));

    //Tremor builds while Thrall 2 says his text bubble.
//Line 8
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer + 2.0, oThrall_2, 40167);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_2, ANIMATION_FIREFORGET_DODGE_DUCK, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_FIREFORGET_DODGE_DUCK, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_1, ANIMATION_FIREFORGET_DODGE_DUCK, 3.0);
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oPC, 30.0));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    fTimer = fTimer + 1.0;

    //Tremor builds further while Thrall 1 says his text bubble.
//Line 9
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 2.0, oThrall_1, 40168);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_1, ANIMATION_LOOPING_TALK_FORCEFUL, 2.0);
    object oFlee = GetObjectByTag("Cut10_ThrallFleeCollapse");
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_1, oFlee, TRUE);
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);
    vector vCameraTremor = Vector(vPC.x, vPC.y, vPC.z + 10.0);
    location lCameraTremor = Location(OBJECT_SELF, vCameraTremor, 0.0);
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oPC, 30.0));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_4, oFlee, TRUE);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_5, oFlee, TRUE);
    CutActionMoveToObject(CUTSCENE_NUMBER, fTimer, oThrall_6, oFlee, TRUE);

    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;

    //Tremor builds further while Thrall 3 says his text bubble.
//Line 10
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, fTimer - 3.5, oThrall_3, 40169);
//
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oThrall_3, ANIMATION_FIREFORGET_TAUNT, 3.0);
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oPC, 30.0));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));

    //Fade all PCs currently watching Cutscene 10 to black amidst further tremors.
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, FadeCut10ToBlack());
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oPC, 30.0));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lTremor));
    DelayCommand(fTimer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lCameraTremor));

    //Jump Thralls back to their starting points.
    DelayCommand(fTimer, Cut10_ResetActors());

    //Destroy Clone of PC.
    DelayCommand(fTimer + 2.0, DestroyClone(oClone));

    //Jump all PCs currently watching Cutscene 10 into Cutscene 11
    //and clear their Cutscene 10 flag.
    object oJumpTarget = GetObjectByTag("Cut11_StatueJumpTarget");
    DelayCommand(fTimer, JumpCut10ToCut11(oJumpTarget));

    //Flag Cutscene 10 as no longer active.
    DelayCommand(fTimer, SetLocalInt(GetModule(), "bCut_10_Active", FALSE));
}

void JoinCutscene(object oPC)
{
    //Jump the player to the observation point.
    object oViewPoint = GetObjectByTag("Cut10_Spectator");
    AssignCommand(oPC, JumpToObject(oViewPoint));
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

void DestroyClone(object oClone)
{
    DestroyObject(oClone);
}

void RemoveOldItems(object oPC)
{
    string sTag;
    object oItem = GetFirstItemInInventory(oPC);
    while(oItem != OBJECT_INVALID)
     {
            sTag = GetTag(oItem);
            if(IsInvalidItem(oItem))
                DestroyObject(oItem);

            oItem = GetNextItemInInventory(oPC);
    }
}
int IsInvalidItem(object oItem)
{
    string sTag = GetTag(oItem);
    return (sTag == "q3_formcrystal" ||
           sTag == "q5b_idol" ||
           sTag == "Q2B_RUNE" ||
           sTag == "Q3_SAC_BLADE"
           );
}
