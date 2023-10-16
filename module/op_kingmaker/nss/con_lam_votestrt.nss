//::///////////////////////////////////////////////
//:: Election Starts
//:: con_lam_votestrt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The election has started
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Aug 2004
//:://////////////////////////////////////////////
#include "inc_remeffect"

int StartingConditional()
{
    int iResult = FALSE;
    object oPC = GetFirstPC();
    RemovePoly(oPC);

    if(GetLocalInt(oPC, "OS_START_VOTE") == 10)
    {
        int iDLGClosing = GetLocalInt(OBJECT_SELF, "flg_cutclosing");
        int iDLGRunning = GetLocalInt(OBJECT_SELF, "flg_cutrunning");

        if ((iDLGClosing == FALSE)&&(iDLGRunning == FALSE))
        {
            SetLocalInt(OBJECT_SELF, "flg_cutrunning", TRUE);

            oPC = GetPCSpeaker();
            SetCutsceneMode(oPC, TRUE);
            AssignCommand(oPC, ClearAllActions(TRUE));
        }
        iResult = TRUE;
    }
    return iResult;
}
