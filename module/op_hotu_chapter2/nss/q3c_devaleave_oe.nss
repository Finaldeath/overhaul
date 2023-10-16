// Deva leaves player if she is currently a follower

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 39;

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oDeva = GetObjectByTag("q3c_Lavoera");
    if(GetMaster(oDeva) != OBJECT_INVALID)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
        AssignCommand(oDeva, ClearAllActions(TRUE));
        AssignCommand(oPC, ClearAllActions(TRUE));
        SetLocalInt(oDeva, "LEAVE_DIALOG", 1);
        CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
        CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
        CutSetCutsceneMode(0.0, oPC, TRUE, FALSE, TRUE, FALSE);
        CutDisableAbort(CUTSCENE_NUMBER);
        CutSetActiveCutsceneForObject(oDeva, CUTSCENE_NUMBER);
        CutJumpToObject(0.0, oDeva, oPC);
        CutActionStartConversation(1.0, oDeva, oPC, "q3san_deva");
        CutDisableCutscene(CUTSCENE_NUMBER, 1.0, 1.0, RESTORE_TYPE_NONE);
    }
}


