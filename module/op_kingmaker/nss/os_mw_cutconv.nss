//::///////////////////////////////////////////////
//:: os_mw_cutconv
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the dialog in cutscene mode :)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: April 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPCSpeaker;
    int iDLGClosing = GetLocalInt(OBJECT_SELF, "flg_cutclosing");
    int iDLGRunning = GetLocalInt(OBJECT_SELF, "flg_cutrunning");
    int iResult = FALSE;;

    // Apr 21 - Check to make sure the dialog isn't currently
    // closing or already in progress or the PC will be stuck
    // in eternal cutscene mode :(
    if ((iDLGClosing == FALSE)&&(iDLGRunning == FALSE))
    {

        oPCSpeaker = GetPCSpeaker();
        SetCutsceneMode(oPCSpeaker, TRUE);

        AssignCommand(oPCSpeaker, ClearAllActions(TRUE));
        SetLocalInt(OBJECT_SELF, "flg_cutrunning", TRUE);
    }

    return iResult;
}
