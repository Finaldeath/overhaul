// Armand appearance before the dracolich lair:
// - comes out of the gas form, threatens and attacks.

int CUTSCENE_NUMBER = 37;

#include "x2_inc_cutscene"
string CONV_NAME = "q3c_cut_armand";

void CallSignalEvent(int nCutscene, object oObject, int nEvent)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        SignalEvent(oObject, EventUserDefined(nEvent));
    }
}

void CutSignalEvent(float fDelay, object oObject, int nEvent, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallSignalEvent(nCutscene, oObject, nEvent)));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    float fConvDur = CutGetConvDuration(CONV_NAME);
    // freeze golem servants
    int i = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    while(oCreature != OBJECT_INVALID)
    {
        if(GetTag(oCreature) == "q3c_GolemServant")
        {
            AssignCommand(oCreature, ClearAllActions());
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oCreature, 10.0 + fConvDur);
            SetLocalInt(oCreature, "NO_FOLLOW", 1);
            DelayCommand(10.0 + fConvDur, SetLocalInt(oCreature, "NO_FOLLOW", 0));
        }
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);

        i++;
    }

    object oArmandSP = GetWaypointByTag("q3c_wp_armand_sp");
    object oCopySP = GetWaypointByTag("q3c_wp_copy_sp");
    object oCamera1 = GetWaypointByTag("q3c_wp_camera1");
    object oArmand = GetObjectByTag("q3_armand2");

    // make sure Armand is friendly to the player
    AdjustReputation(oPC, oArmand, 100);
    AdjustReputation(oArmand, oPC, 100);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutDisableAbort(CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oArmand, CUTSCENE_NUMBER);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "q3c_pc_copy");
    CutFadeOutAndIn(0.0, oPC, 2.5);
    CutSetLocation(0.0, oPC);
    CutSetCutsceneMode(0.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutJumpToObject(1.0, oCopy, oPC);
    CutJumpToObject(0.5, oPC, oCamera1);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 18.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutApplyEffectAtLocation(1.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SMOKE_PUFF, GetLocation(oArmandSP));
    CutJumpToObject(0.5, oArmand, oArmandSP);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutBeginConversation(2.0, oArmand, oArmand, CONV_NAME);
    CutFadeOutAndIn(fConvDur, oPC, 3.0);
    CutAdjustReputation(0.0, oArmand, oPC, -100);
    CutAdjustReputation(0.0, oPC, oArmand, -100);
    CutSignalEvent(0.0, oArmand, 101);
    CutDisableCutscene(CUTSCENE_NUMBER, 1.0, 1.0);
}
