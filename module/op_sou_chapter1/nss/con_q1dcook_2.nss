//::///////////////////////////////////////////////
//:: Name con_q1dcook_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
if selected before the tavern plot is over
Mara has been switched for a PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1DPCHOSTAGE") == 1 && GetLocalInt(OBJECT_SELF, "nFreed") == 1)
        return TRUE;
    return FALSE;
}
