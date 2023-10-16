// Ring the gong: if the player did not brake into the temple, a cutscene would start:
// - The villagers are shown gathering around the court.
// - The camera jumps towards the gates of the temple.
// - Armand, the high pries, emerges from the temple.
// - Armand walks towards the court and the two cultis accompany him.
// - Armand inits dialog with the player.
// - Player is still in cutscene mode during the dialog and a new cutscene would start depending
// on the player's choice during the dialog.

#include "x2_inc_cutscene"
#include "x0_i0_anims"
#include "nw_i0_plot"

int CUTSCENE_NUMBER = 31;

float TIME_START = 2.0;
float TIME_JUMP = TIME_START + 0.5;
float TIME_CAMERA2 = TIME_JUMP + 10.0;
float TIME_WALK = TIME_CAMERA2 + 4.0;
float TIME_TALK = TIME_WALK + 22.0;

void CallFreeze(int nCutscene, object oPC)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
            FreezeAssociate(oPC, FALSE);
        }
}

void CutFreeze(float fDelay, object oPC)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallFreeze(nCutscene, oPC));
}

void main()
{
    object oPC = GetLastUsedBy();
    int nNoCutscene = GetLocalInt(GetModule(), "q3_NoCutscene");
    AssignCommand(oPC, PlaySound("as_cv_gongring2"));
    if(nNoCutscene == 1)
    {
        FloatingTextStrRefOnCreature(84832, oPC);
        return;
    }

    Reward_2daXP(oPC, 17);
    object oItem1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oItem2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    if(oItem1 != OBJECT_INVALID)  ActionUnequipItem(oItem1);
    if(oItem2 != OBJECT_INVALID)  ActionUnequipItem(oItem2);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT);

    SetLocalInt(GetModule(), "q3_NoCutscene", 1);
    object oAssociatesJump = GetWaypointByTag("q3a_wp_associates_jump");
    object oCamera1 = GetWaypointByTag("q3a_wp_camera1");
    object oCamera2 = GetWaypointByTag("q3a_wp_camera2");
    object oCamera3 = GetWaypointByTag("q3a_wp_camera3");
    object oCamera4 = GetWaypointByTag("q3a_wp_camera4");
    object oWPCreate = GetWaypointByTag("q3a_wp_create");
    object oArmandSP = GetWaypointByTag("q3a_wp_armand");
    object oArmand = GetObjectByTag("q3_armand");
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");
    object oWPMonk1 = GetWaypointByTag("q3a_wp_monk1_walk");
    object oWPMonk2 = GetWaypointByTag("q3a_wp_monk2_walk");
    object oArmandWalk = GetWaypointByTag("q3a_wp_armand_walk");
    object oSacWP = GetWaypointByTag("q3a_wp_sacrifice");
    object oSac = GetNearestObjectByTag("q3a_sacrifice");
    object oDoor = GetNearestObjectByTag("q3a_TempleDoor");
    effect eGhost = EffectCutsceneGhost();
    CutSetActiveCutsceneForObject(oDoor, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oArmand, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oCultist1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oCultist2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eGhost, oArmand, TIME_TALK);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eGhost, oCultist1, TIME_TALK);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eGhost, oCultist2, TIME_TALK);
    CutSetAmbient(TIME_START + 0.2, oPC, 3);
    CutStoreMusic(TIME_START, oPC);
    CutFadeOutAndIn(TIME_START + 0.5, oPC);
    CutJumpAssociateToLocation(TIME_START + 2.0, oPC, GetLocation(oAssociatesJump));
    CutFreeze(TIME_START + 4.0, oPC);
    CutSetCutsceneMode(TIME_START + 1.5, oPC, TRUE, TRUE, TRUE, TRUE);
    CutSetCameraSpeed(TIME_START + 2.0, oPC, 0.7);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oWPCreate), "cut31_pc_copy");
    CutSetLocation(TIME_START, oPC);
    SetLocalObject(oPC, "q2a_copy", oCopy);
    CutJumpToLocation(TIME_START + 1.0, oCopy, GetLocation(oPC));
    CutJumpToObject(TIME_START + 1.7, oPC, oCamera1);
    CutSetCamera(TIME_START + 1.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 15.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(TIME_START + 3.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 40.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);

    // freeze all other players
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        if(oPlayer != oPC)
        {
            CutSetActiveCutsceneForObject(oPlayer, CUTSCENE_NUMBER);
            CutApplyEffectToObject2(TIME_START, DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPlayer);
            CutFadeOutAndIn(TIME_START + 0.5, oPlayer);
            CutSetCutsceneMode(TIME_START + 0.5, oPlayer, TRUE, FALSE, TRUE, TRUE);
            CutSetLocation(TIME_START, oPlayer);
        }
        oPlayer = GetNextPC();
    }
    CutSetAbortDelay(CUTSCENE_NUMBER, 1.5);
    CutSetDestroyCopyDelay(CUTSCENE_NUMBER, 1.5);
    // jumping slaves into place
    int i = 1;
    object oJumpWP;
    object oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    object oWP = GetNearestObjectByTag("q3a_wp_slave", oPC, i);
    float fDelay;
    while(i <= 8)
    {
        fDelay += 0.1;
        AssignCommand(oSlave, ClearAllActions());
        AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE));
        AssignCommand(oSlave, ClearAllActions());
        DelayCommand(1.0, AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE)));
        CutSetActiveCutsceneForObject(oSlave, CUTSCENE_NUMBER);
        CutJumpToObject(TIME_JUMP + fDelay, oSlave, oWP);
        i++;
        oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
        oWP = GetNearestObjectByTag("q3a_wp_slave", oPC, i);
    }

    // Handle last 2 slaves: walking to place instead of jumping in.
    object oSlaveA = GetNearestObjectByTag("Q3A_SLAVE", oPC, 10);
    object oWPA = GetNearestObjectByTag("q3a_wp_slave1", oPC);
    object oSlaveB = GetNearestObjectByTag("Q3A_SLAVE", oPC, 11);
    CutSetActiveCutsceneForObject(oSlaveA, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oSlaveB, CUTSCENE_NUMBER);
    AssignCommand(oSlaveA, ClearAllActions());
    AssignCommand(oSlaveB, ClearAllActions());
    AssignCommand(oSlaveA, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE));
    AssignCommand(oSlaveB, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE));
    AssignCommand(oSlaveA, ClearAllActions());
    AssignCommand(oSlaveB, ClearAllActions());
    object oWPB = GetNearestObjectByTag("q3a_wp_slave2", oPC);
    object oJump1 = GetNearestObjectByTag("q3a_wp_jump1");
    object oJump2 = GetNearestObjectByTag("q3a_wp_jump2");
    CutJumpToObject(TIME_JUMP, oSlaveA, oJump1);
    CutJumpToObject(TIME_JUMP, oSlaveB, oJump2);
    CutActionMoveToObject(TIME_JUMP + 1.8, oSlaveA, oWPA, FALSE);
    CutActionMoveToObject(TIME_JUMP + 2.0, oSlaveB, oWPB, FALSE);
    CutSetFacingPoint(TIME_JUMP + 6.0, oSlaveA, GetTag(OBJECT_SELF));
    CutSetFacingPoint(TIME_JUMP + 7.0, oSlaveB, GetTag(OBJECT_SELF));

    // Jump in the sacrifice woman
    CutSetActiveCutsceneForObject(oSac, CUTSCENE_NUMBER);
    AssignCommand(oSac, ClearAllActions());
    AssignCommand(oSlaveA, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE));
    CutJumpToObject(TIME_JUMP, oSac, oSacWP);
    CutFadeOutAndIn(TIME_CAMERA2, oPC, 1.0);
    CutSetMusic(TIME_CAMERA2 + 0.5, oPC, TRACK_BATTLE_CITY2);
    CutJumpToObject(TIME_CAMERA2 + 0.5, oPC, oCamera2);
    CutSetCamera(TIME_CAMERA2 + 0.5, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 7.0, 90.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionOpenDoor(TIME_CAMERA2 + 1.8, oDoor, oDoor);
    CutJumpToObject(TIME_CAMERA2 + 2.3, oArmand, oArmandSP);
    CutActionMoveToLocation(TIME_WALK, oArmand, GetLocation(oArmandWalk), FALSE);
    CutActionCloseDoor(TIME_WALK + 2.0, oDoor, oDoor);
    CutActionMoveToLocation(TIME_WALK + 2.5, oCultist1, GetLocation(oWPMonk1), FALSE);
    CutActionMoveToLocation(TIME_WALK + 2.5, oCultist2, GetLocation(oWPMonk2), FALSE);
    CutSetCameraSpeed(TIME_WALK + 2.5, oPC, 0.8);
    CutActionMoveToLocation(TIME_WALK, oPC, GetLocation(oCamera3), FALSE);
    //CutActionMoveToLocation(TIME_WALK, oPC, GetLocation(oCultist1), FALSE);
    CutSetCamera(TIME_WALK + 5.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 14.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetAmbient(TIME_WALK + 9.0, oPC, 65);
    CutRestoreMusic(TIME_TALK, oPC);
    CutBeginConversation(TIME_TALK, oPC, oArmand, "q3vil_cut_armand");
    //CutApplyEffectToObject2(TIME_TALK - 3.6, DURATION_TYPE_PERMANENT, eSlow, oPC);
    //CutActionMoveToLocation(TIME_TALK - 3.5, oPC, GetLocation(oCamera4), FALSE);
    CutSetCamera(TIME_TALK - 7.5, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 14.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutDisableCutscene(CUTSCENE_NUMBER, TIME_TALK + 0.5, TIME_TALK + 0.5);
}

