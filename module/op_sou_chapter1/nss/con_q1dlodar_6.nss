//::///////////////////////////////////////////////
//:: Name: con_q1dlodar_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
the plot is finished
the speaker is the PC who completed the plot
the kobolds surrendered and were allowed to leave

("Lodar_Job" has been set to 4 on the player)
- set to 2 means they were just allowed to run out
without surendering first..
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
        if (GetLocalInt(GetPCSpeaker(), "Lodar_Job") == 4 || GetLocalInt(GetPCSpeaker(), "Lodar_Job") == 2)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
