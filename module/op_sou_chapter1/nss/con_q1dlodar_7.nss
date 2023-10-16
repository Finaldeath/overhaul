//::///////////////////////////////////////////////
//:: Name: con_q1dlodar_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
the plot is finished
the speaker is the PC who completed the plot
the kobolds surrendered and were slaughtered

("Lodar_Job" has been set to 5 on the player)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////


int StartingConditional()
{
    //if the cook quest has been completed.
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1dcook") > 10)
    {
        //if the PC was the one who did the quest
        if (GetLocalInt(GetPCSpeaker(), "Lodar_Job") == 5)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
