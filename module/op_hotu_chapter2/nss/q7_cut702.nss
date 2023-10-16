// First interjection cutscene (matron speeks with meph)

#include "x2_inc_cutscene"
int CUTSCENE_NUMBER = 702;
string DIALOG_NAME = "q7_cut_val0a";

void SetAssociate(object oHench)
{
    CutSetActiveCutsceneForObject(oHench, CUTSCENE_NUMBER);
    CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oHench);
}

void main()
{
    object oPC = OBJECT_SELF;
    SetLocalObject(GetModule(), "X2_CUT702_PC", oPC); // used inside the dialog to get the pc
    object oMatron = GetObjectByTag("q7_matron");
    object oMeph = GetObjectByTag("q7_meph");
    object oCamera1 = GetWaypointByTag("q7b_wp_camera1");
    float fDialogDur = CutGetConvDuration(DIALOG_NAME);
    location lLoc = GetLocation(oPC);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oMatron, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oMeph, CUTSCENE_NUMBER);
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        SetAssociate(oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oDominate = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    SetAssociate(oAnimal);
    SetAssociate(oSummon);
    SetAssociate(oDominate);
    SetAssociate(oFamiliar);

    CutSetLocation(0.0, oPC);
    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutJumpToObject(0.5, oPC, oCamera1);
    CutSetCutsceneMode(2.5, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, FALSE, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 50.0, 18.0, 80.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 60.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 60.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutBeginConversation(2.0, oMeph, oMatron, DIALOG_NAME);

    CutFadeOutAndIn(fDialogDur, oPC, 3.0);

    CutRemoveEffects(1.0, oAnimal);
    CutRemoveEffects(0.0, oSummon);
    CutRemoveEffects(0.0, oDominate);
    CutRemoveEffects(0.0, oFamiliar);

    i = 1;
    oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutRemoveEffects(0.0, oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }
    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);

}

