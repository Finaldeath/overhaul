//::///////////////////////////////////////////////
//:: Cutscene 11 (Include)
//:: Inc_Cutscene_11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Shared functions for the opening cutscene,
     Part II (#11)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"

void Cut11_FadeToBlack(float fSpeed = FADE_SPEED_MEDIUM)
{
    //Find all PCs currently in Cutscene 11.
    object oAshtara = GetObjectByTag("Cut11_Ashtara");
    int iNth = 1;
    object oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAshtara, iNth);
    int iPC_Cutscene = GetLocalInt(oNearestPC, "nCutsceneNumber");
    while (iPC_Cutscene == TRUE)
    {
        //Fade them to black.
        FadeToBlack(oNearestPC, fSpeed);
        //Update Loop variables.
        iNth++;
        oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAshtara, iNth);
        iPC_Cutscene = GetLocalInt(oNearestPC, "nCutsceneNumber");
    }
}

void Cut11_ThrallBash()
{
    //Identify the 4 Thralls
    object oThrall_1 = GetObjectByTag("Cut11_Thrall_1");
    object oThrall_2 = GetObjectByTag("Cut11_Thrall_2");
    object oThrall_3 = GetObjectByTag("Cut11_Thrall_3");
    object oThrall_4 = GetObjectByTag("Cut11_Thrall_4");
    //Identify the rubble nearest each of them.
    object oRubble_1 = GetNearestObjectByTag("AsabiRubble", oThrall_1);
    object oRubble_2 = GetNearestObjectByTag("AsabiRubble", oThrall_2);
    object oRubble_3 = GetNearestObjectByTag("AsabiRubble", oThrall_3);
    object oRubble_4 = GetNearestObjectByTag("AsabiRubble", oThrall_4);
    //Make them bash the rubble.
    AssignCommand(oThrall_1, DoPlaceableObjectAction(oRubble_1, PLACEABLE_ACTION_BASH));
    AssignCommand(oThrall_2, DoPlaceableObjectAction(oRubble_2, PLACEABLE_ACTION_BASH));
    AssignCommand(oThrall_3, DoPlaceableObjectAction(oRubble_3, PLACEABLE_ACTION_BASH));
    AssignCommand(oThrall_4, DoPlaceableObjectAction(oRubble_4, PLACEABLE_ACTION_BASH));
}

void Cut11_EndCutscene()
{
    //Find all PCs currently in Cutscene 11.
    object oAshtara = GetObjectByTag("Cut11_Ashtara");
    object oJumpTarget = GetObjectByTag("Undrentide_StartLoc");


    float fTimer;
    int iNth = 1;
    object oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAshtara, iNth);
    int iCutNum = GetLocalInt(oNearestPC, "nCutsceneNumber");
    while (iCutNum == 11)
    {
        //Set the Timer
        fTimer = 0.0;
        //Fade them to black.
        DelayCommand(fTimer, FadeToBlack(oNearestPC, FADE_SPEED_SLOW));
        //Remove their effects.
        fTimer = fTimer + 1.0;
//        CutRemoveEffects(iCutNum, fTimer, oNearestPC);
        effect ePetrify = GetFirstEffect(oNearestPC);
        while (GetIsEffectValid(ePetrify))
        {
            if(GetEffectCreator(ePetrify) == GetArea(oNearestPC))
            {
                DelayCommand(fTimer, RemoveEffect(oNearestPC, ePetrify));
            }
            ePetrify = GetNextEffect(oNearestPC);
        }
        //Jump them to The Lost City of Undrentide.
        //CutJumpToObject(iCutNum, fTimer, oNearestPC, oJumpTarget);
        DelayCommand(fTimer, AssignCommand(oNearestPC, JumpToObject(oJumpTarget)));

        //Fade them from black.
        fTimer = fTimer + 1.0;
        DelayCommand(fTimer, FadeFromBlack(oNearestPC, FADE_SPEED_FAST));
        //Set their Cutscene Mode.
        fTimer = fTimer + 1.5;
        DelayCommand(fTimer, SetCutsceneMode(oNearestPC, FALSE));
//        CutSetCutsceneMode(iCutNum, fTimer, oNearestPC, FALSE);
        //Set their camera to prevent it from gakking out.
        fTimer = fTimer + 0.5;
        DelayCommand(fTimer, AssignCommand(oNearestPC, SetCameraFacing(90.0, 20.0, 50.0)));
//        CutSetCamera(iCutNum, fTimer, oNearestPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
        //Reset their personal Cutscene Flag
        SetLocalInt(oNearestPC, "nCutsceneNumber", FALSE);
        //Make sure they're no longer flagged as the Main PC for this cutscene.
        string sMainPC = "bMainPC_Cut"+IntToString(iCutNum);
        SetLocalInt(oNearestPC, sMainPC, FALSE);
        //Update Loop variables.
        iNth++;
        oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAshtara, iNth);
        iCutNum = GetLocalInt(oNearestPC, "nCutsceneNumber");
    }
    fTimer = fTimer + 5.0;
    //DestroyCampaignDatabase("dbPlayers");
}

void Cut11_ResetActors()
{
    float fTimer = 0.0;
    int iCutNum = 11;

    //Jump the Thralls back to their starting positions.
    object oThrall_1 = GetObjectByTag("Cut11_Thrall_1");
    object oThrall_2 = GetObjectByTag("Cut11_Thrall_2");
    object oThrall_3 = GetObjectByTag("Cut11_Thrall_3");
    object oThrall_4 = GetObjectByTag("Cut11_Thrall_4");
    object oAshtara = GetObjectByTag("Cut11_Ashtara");
    object oJump_1 = GetObjectByTag("Cut11_SpawnThrall_1");
    object oJump_2 = GetObjectByTag("Cut11_SpawnThrall_2");
    object oJump_3 = GetObjectByTag("Cut11_SpawnThrall_3");
    object oJump_4 = GetObjectByTag("Cut11_SpawnThrall_4");
    object oJump_Ash = GetObjectByTag("Cut11_AshtaraStart");
    CutClearAllActions(iCutNum, fTimer, oThrall_1);
    CutClearAllActions(iCutNum, fTimer, oThrall_2);
    CutClearAllActions(iCutNum, fTimer, oThrall_3);
    CutClearAllActions(iCutNum, fTimer, oThrall_4);
    CutClearAllActions(iCutNum, fTimer, oAshtara);
//            CutJumpToObject(iCutNum, fTimer, oThrall_1, oJump_1);
//            CutJumpToObject(iCutNum, fTimer, oThrall_2, oJump_2);
//            CutJumpToObject(iCutNum, fTimer, oThrall_3, oJump_3);
//            CutJumpToObject(iCutNum, fTimer, oThrall_4, oJump_4);
    fTimer = fTimer + 1.0;
    DelayCommand(fTimer, AssignCommand(oThrall_1, JumpToObject(oJump_1)));
    DelayCommand(fTimer, AssignCommand(oThrall_2, JumpToObject(oJump_2)));
    DelayCommand(fTimer, AssignCommand(oThrall_3, JumpToObject(oJump_3)));
    DelayCommand(fTimer, AssignCommand(oThrall_4, JumpToObject(oJump_4)));
    DelayCommand(fTimer, AssignCommand(oAshtara, JumpToObject(oJump_Ash)));
}


