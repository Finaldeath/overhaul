//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Beginning = 03
//:: WW1_Mem_Beg03_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player began memorial with
     option 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iBeginningComplete = GetLocalInt(OBJECT_SELF, "iBeginningComplete");

    if (iBeginningComplete == 3)
    {
        return TRUE;
    }
    return FALSE;
}
