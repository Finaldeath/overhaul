//::///////////////////////////////////////////////
//:: Name: con_q1dlodar_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
- the player has not yet spoken to Lodar, the plot has not yet been resolved
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////


int StartingConditional()
{
    //if the cook quest has not been completed.
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1dcook") <= 10  && GetLocalInt(GetPCSpeaker(), "nSpokeToLodar") == 0)
    {

            return TRUE;


    }
    return FALSE;
}
