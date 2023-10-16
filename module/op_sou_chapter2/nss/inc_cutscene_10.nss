//::///////////////////////////////////////////////
//:: Cutscene 10 (Include)
//:: Inc_Cutscene_10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Shared functions for the opening cutscene,
     Part I (#10)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"



void FadeCut10ToBlack()
{
    //Find all PCs currently in Cutscene 10.
    object oThrall_1 = GetObjectByTag("Cut10_Thrall_1");
    int iNth = 1;
    object oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oThrall_1, iNth);
    int iPC_Cutscene = GetLocalInt(oNearestPC, "nCutsceneNumber");
    while (iPC_Cutscene == 10)
    {
        //Fade them to black.
        FadeToBlack(oNearestPC);
        //Update Loop variables.
        iNth++;
        oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oThrall_1, iNth);
        iPC_Cutscene = GetLocalInt(oNearestPC, "nCutsceneNumber");
    }
}

void JumpCut10ToCut11(object oJumpTarget)
{
    //Find all PCs currently in Cutscene 10.
    object oThrall_1 = GetObjectByTag("Cut10_Thrall_1");
    int iNth = 1;
    object oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oThrall_1, iNth);
    int iCutNum = GetLocalInt(oNearestPC, "nCutsceneNumber");
    while (iCutNum == 10)
    {
        //Clear all effects from the player.
//        CutRemoveEffects(10, 0.0, oNearestPC);
        effect eInvis = GetFirstEffect(oNearestPC);
        while (GetIsEffectValid(eInvis))
        {
            if(GetEffectCreator(eInvis) == GetArea(oNearestPC))
            {
                RemoveEffect(oNearestPC, eInvis);
            }
            eInvis = GetNextEffect(oNearestPC);
        }
        //Jump them to the start of Cutscene 11.
        AssignCommand(oNearestPC, JumpToObject(oJumpTarget));
        //Flag them as having completed Cutscene 10.
        SetLocalInt(oNearestPC, "nCutsceneNumber", FALSE);

        //Make sure they're no longer flagged as the Main PC for this cutscene.
        string sMainPC = "bMainPC_Cut"+IntToString(iCutNum);
        SetLocalInt(oNearestPC, sMainPC, FALSE);
        //Fade in the PCs screen
        FadeFromBlack(oNearestPC, FADE_SPEED_FAST);

        //Turn off their Cutscene Mode.
        SetCutsceneMode(oNearestPC, FALSE);

        //Set their camera to prevent it from gakking out.
        AssignCommand(oNearestPC, SetCameraFacing(90.0, 20.0, 50.0));

        //Update Loop variables.
        iNth++;
        oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oThrall_1, iNth);
        iCutNum = GetLocalInt(oNearestPC, "nCutsceneNumber");


    }
}

void Cut10_ResetActors()
{
    int iCutNum = 10;
    float fTimer = 0.0;

    //Jump Thralls back to their starting points.
    object oThrall_1 = GetObjectByTag("Cut10_Thrall_1");
    object oThrall_2 = GetObjectByTag("Cut10_Thrall_2");
    object oThrall_3 = GetObjectByTag("Cut10_Thrall_3");
    object oThrall_4 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 1);
    object oThrall_5 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 2);
    object oThrall_6 = GetNearestObjectByTag("Cut10_Thrall", oThrall_1, 3);
    object oJump_1 = GetObjectByTag("Cut10_Jump_Thrall_1");
    object oJump_2 = GetObjectByTag("Cut10_Jump_Thrall_2");
    object oJump_3 = GetObjectByTag("Cut10_Jump_Thrall_3");
    object oJump_4 = GetObjectByTag("Cut10_Jump_Thrall_4");
    object oJump_5 = GetObjectByTag("Cut10_Jump_Thrall_5");
    object oJump_6 = GetObjectByTag("Cut10_Jump_Thrall_6");
    CutJumpToObject(iCutNum, fTimer, oThrall_1, oJump_1);
    CutJumpToObject(iCutNum, fTimer, oThrall_2, oJump_2);
    CutJumpToObject(iCutNum, fTimer, oThrall_3, oJump_3);
    CutJumpToObject(iCutNum, fTimer, oThrall_4, oJump_4);
    CutJumpToObject(iCutNum, fTimer, oThrall_5, oJump_5);
    CutJumpToObject(iCutNum, fTimer, oThrall_6, oJump_6);
}
