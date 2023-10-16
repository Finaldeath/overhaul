//::///////////////////////////////////////////////
//:: Name x1_abort_cutscn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene aborted script.
    Check to see which cutscene has been aborted by
    the player and run the appropriate script to
    remove the player from the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Feb 4/ 03
//::
//::
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    int iCutNum = GetLocalInt(oPC, "nCutsceneNumber");
    string sCutNum = IntToString(iCutNum);
    string sMainPC = "bMainPC_Cut"+sCutNum;
    int bMainPC = GetLocalInt(oPC, sMainPC);
    string sAborted = "bAborted_Cut"+sCutNum;
    int bAborted = GetLocalInt(GetModule(), sAborted);
    //if this was the Main PC aborting, abort for everyone
    if (bMainPC == TRUE && bAborted == FALSE)
    {
        //Prevent double-aborting
        SetLocalInt(GetModule(), sAborted, TRUE);
        //Execute a script called "abort_cut"+CutsceneNumber
        string sAbortScript = "abort_cut"+sCutNum;
        ExecuteScript(sAbortScript, GetModule());
    }
    //else it was a spectator PC, provide error message and do not abort.
    else if (bMainPC == FALSE && bAborted == FALSE)
    {
        //Prevent double-aborting
        SetLocalInt(GetModule(), sAborted, TRUE);
        //Send error message (no message in final cutscene - as it can't be aborted)
        if (iCutNum != 30)
            FloatingTextStrRefOnCreature(40419, oPC, FALSE);
    }
    //Reset the double-aborting so it can still be aborted the next time it runs.
    else if (bAborted == TRUE)
    {
        SetLocalInt(GetModule(), sAborted, FALSE);
    }
}
