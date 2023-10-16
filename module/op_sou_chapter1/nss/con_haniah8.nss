//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if the PC still needs herbs.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1cure")<40
        && GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1cure")>0)
        return TRUE;
    return FALSE;
}
