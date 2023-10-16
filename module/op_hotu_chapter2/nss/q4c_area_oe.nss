// When first entering: start a cutscene that shows an argument between the two golem factions
// that erupts into a fight.

int CUTSCENE_NUMBER = 41;
string DIALOG_NAME = "q4c_cutscene1";

#include "x2_inc_cutscene"

void SetupArea(object oPC)
{
    object oDoor = GetObjectByTag("q4c_jail_door");
    SetLocalInt(oDoor, "X2_L_RESISTKNOCK", 1);
}

void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}


void GenerateArcaneTreasure()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE", 1);

    object oChest1 = GetObjectByTag("q4c_chest1");
    object oChest2 = GetObjectByTag("q4c_chest2");
    object oChest3 = GetObjectByTag("q4c_chest3");
    object oChest4 = GetObjectByTag("q4c_chest4");

    CreateItemOnObject("q4_golleftleg", oChest1);
    CreateItemOnObject("q4_golrightleg", oChest2);
    CreateItemOnObject("q4_golemtorso", oChest3);
    CreateItemOnObject("q4_gollefthand", oChest4);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nSorc = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int nWiz = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);

    if(nSorc >= 5 || nWiz >= 5)
        GenerateArcaneTreasure();
    SetupArea(oPC);
    //AutoSave();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ARGUE_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ARGUE_CUTSCENE_ONCE", 1);

    object oGoodLeader = GetObjectByTag("q4c_CutsceneGoodLeader");
    object oGood1 = GetObjectByTag("q4c_CutsceneGood1");
    object oGood2 = GetObjectByTag("q4c_CutsceneGood2");
    object oGood3 = GetObjectByTag("q4c_CutsceneGood3");

    object oEvilLeader = GetObjectByTag("q4c_CutsceneEvilLeader");
    object oEvil1 = GetObjectByTag("q4c_CutsceneEvil1");
    object oEvil2 = GetObjectByTag("q4c_CutsceneEvil2");
    object oEvil3 = GetObjectByTag("q4c_CutsceneEvil3");

    object oCamera1 = GetObjectByTag("q4c_wp_camera1");
    object oCamera2 = GetObjectByTag("q4c_wp_camera2");
    object oCopySP = GetObjectByTag("q3c_wp_copy_create");

    float fDialogLen = CutGetConvDuration(DIALOG_NAME);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oGoodLeader, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGood1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGood2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGood3, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oEvilLeader, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oEvil1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oEvil2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oEvil3, CUTSCENE_NUMBER);

    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "boom");
    CutFadeOutAndIn(0.0, oPC, 2.5);
    CutSetCutsceneMode(0.5, oPC, TRUE, TRUE, TRUE, TRUE);
    CutSetLocation(0.0, oPC);
    CutSetCameraSpeed(0.3, oPC, 0.6);
    CutJumpToObject(0.0, oCopy, oCamera1);

    CutJumpToObject(0.0, oPC, oCamera1);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionMoveToLocation(0.5, oPC, GetLocation(oCamera2), FALSE);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 11.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutBeginConversation(3.0, oGoodLeader, oEvilLeader, DIALOG_NAME);
    CutActionAttack(fDialogLen - 1.0, oEvilLeader, oGoodLeader);
    CutActionAttack(0.0, oGoodLeader, oEvilLeader);
    CutActionAttack(1.0, oEvil1, oGood1);
    CutActionAttack(0.0, oEvil2, oGood2);
    CutActionAttack(0.0, oEvil3, oGood3);
    CutActionAttack(0.0, oGood1, oEvil1);
    CutActionAttack(0.0, oGood2, oEvil2);
    CutActionAttack(0.0, oGood3, oEvil3);
    CutAdjustReputation(1.0, oGoodLeader, oEvilLeader, -50);
    CutAdjustReputation(0.0, oEvilLeader, oGoodLeader, -50);
    CutAdjustReputation(3.0, oPC, oEvilLeader, -50);
    CutAdjustReputation(0.0, oEvilLeader, oPC, -50);
    CutAdjustReputation(0.0, oGoodLeader, oPC, -50);
    CutAdjustReputation(0.0, oPC, oGoodLeader, -50);
    CutFadeOutAndIn(0.0, oPC, 1.5);
    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);
}
