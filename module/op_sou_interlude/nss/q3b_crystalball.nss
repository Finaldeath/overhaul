// Whenever a player uses the crystal ball init a cutscene that shows the next button that should
// be pressed. When the player presses the last button this object should be destroyed.
// Pressing the wrong button would init the puzzle.

#include "x1_inc_cutscene"

int CUTSCENE_NUMBER = 2;
float TIME_START = 0.0;
float TIME_AFTER_FADE = 3.0;
float TIME_END = TIME_AFTER_FADE + 5.0;

object oNewPC;

void CreatePCCopy(object oPC)
{
    oNewPC = CopyObject(oPC, GetLocation(oPC));
    SetPlotFlag(oNewPC, TRUE);
    SetLocalInt(oNewPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalObject(GetModule(), "Q3_PC_PUZZLE_COPY", oNewPC);
}

void DestroyPCCopy()
{
    object oCopy = GetLocalObject(GetModule(), "Q3_PC_PUZZLE_COPY");
    SetPlotFlag(oNewPC, FALSE);
    DestroyObject(oCopy);
}

void FreezeAll(object oPC)
{
    int n = 1;
    float fDistance;
    effect eHold = EffectCutsceneParalyze();
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
    while (oCreature != OBJECT_INVALID)
    {
        if(oCreature != oPC)
        {
            fDistance = GetDistanceBetween(oPC, oCreature);
            if(fDistance > 60.0)
                return;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHold, oCreature, TIME_END + 1.0);

        }
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
        n++;
    }
}

void ShowButton(int nNum, object oPC)
{
    int nCutsceneRunning = GetLocalInt(OBJECT_SELF, "RUNNING");
    if(nCutsceneRunning == 1)
        return;
    SetLocalInt(OBJECT_SELF, "RUNNING", 1);
    //FreezeAssociate(oPC);
    FreezeAll(oPC);
    AssignCommand(oPC, ClearAllActions());

    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT2MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT2RUNNING", CUTSCENE_NUMBER);

    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_START, oPC, TRUE, TRUE, TRUE);
    // get the correct button (next one to use)
    object oButton = GetNearestObjectByTag("Q3B_BUTTON" + IntToString(nNum));
    // get the camera position
    object oWP = GetNearestObjectByTag("Q3B_WP_CUTSCENE", oButton);

    //CutRemoveEffects(CUTSCENE_NUMBER, TIME_START, oPC);
    CutSetLocation(CUTSCENE_NUMBER, TIME_START, oPC);
    CutFadeOutAndIn(CUTSCENE_NUMBER, TIME_START + 1.0, oPC);
    DelayCommand(TIME_START + 1.0, CreatePCCopy(oPC));
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_START + 3.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    // Handling opposite sides of the rooms
    float fFacing = 0.0;
    if(nNum == 2 || nNum == 3 || nNum == 5)
        fFacing = 180.0;
    CutSetCamera(CUTSCENE_NUMBER, TIME_AFTER_FADE, oPC, CAMERA_MODE_TOP_DOWN,
                    fFacing, 0.0, 40.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_AFTER_FADE, oPC, GetLocation(oWP));

    CutRestoreLocation(CUTSCENE_NUMBER, TIME_END, oPC);
    CutRemoveEffects(CUTSCENE_NUMBER, TIME_END, oPC);
    //CutDestroyObject(CUTSCENE_NUMBER, TIME_END, oNewPC);
    DelayCommand(TIME_END, DestroyPCCopy());
    //DelayCommand(TIME_END + 1.0, UnFreezeAssociate(oPC));
    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_END, oPC, FALSE);
    DelayCommand(TIME_END + 0.5, AssignCommand(oPC, SpeakStringByStrRef(75967)));
    DelayCommand(TIME_END + 3.0, SetLocalInt(OBJECT_SELF, "RUNNING", 0));

}

void main()
{
    object oPC = GetLastUsedBy();
    object oDrogan = GetNearestObjectByTag("Q3B_DROGAN");
    if(oDrogan == OBJECT_INVALID || GetLocalInt(oDrogan, "DIALOG_STATUS") < 2)
    {
        DelayCommand(1.0, FloatingTextStrRefOnCreature(76457, oPC));
        return;
    }

    // Get the puzzle status (which lever should be shown now)
    int nStatus = GetLocalInt(GetArea(OBJECT_SELF), "Q3B_PORTAL_STATUS");
    ShowButton(nStatus + 1, oPC);

}
