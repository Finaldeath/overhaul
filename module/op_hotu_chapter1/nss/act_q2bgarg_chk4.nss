//::///////////////////////////////////////////////
//:: Name  act_q2bgarg_chk4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The gargoyle's will lock in place after being
    correctly aimed at the door (**unless reset by
    the timer**).  PCs will not be able to adjust them

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 10/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    string szGargNumber = GetStringRight(GetTag(OBJECT_SELF), 1);
    if (GetLocalInt(GetModule(), "X2_nGarg" + szGargNumber + "Hit") != 1)
        return TRUE;
    return FALSE;
}
