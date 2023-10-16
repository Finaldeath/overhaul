//::///////////////////////////////////////////////
//:: Quarry Plot, Lazy Hasn't Talked Yet (Condition Script)
//:: H2c_Lazy_NoTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player hasn't talked to
     Lazy the Imp yet but he has already spawned
     in.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bLazyTalked = GetLocalInt(GetModule(), "bLazyTalked");
    object oLazy = GetObjectByTag("H2_LazyBody");

    if (bLazyTalked == FALSE &&
        oLazy != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
