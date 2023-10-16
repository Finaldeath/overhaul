//::///////////////////////////////////////////////
//:: Name con_q1dcook_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 if selected before the tavern plot is over
    Mara has not been switched for a PC and is still captive
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1dcook") <= 10 && GetLocalInt(GetModule(), "Captive_Cook") == 0 && GetLocalInt(OBJECT_SELF, "nFreed") != 1)
        return TRUE;
    return FALSE;
}
