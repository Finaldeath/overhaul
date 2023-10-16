//::///////////////////////////////////////////////
//:: os_gm_cutconv
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the dialog in cutscene mode :)
    This is for the Psionic Crystal
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
        AssignCommand(oPCSpeaker, ClearAllActions(TRUE));
        SetLocalInt(OBJECT_SELF, "flg_cutrunning", TRUE);
        SetCutsceneMode(oPCSpeaker, TRUE);
    }

    // this will cause the sword to fire a blank one liner and
    // close the conversation if the player tries to init a conversation
    // while the light object fades.
    if(iDLGClosing == TRUE)
    {
        iResult = TRUE;
    }

    iResult = FALSE;
    return iResult;
}
