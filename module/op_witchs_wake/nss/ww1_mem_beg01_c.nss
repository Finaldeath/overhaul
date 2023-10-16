//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Beginning = 01
//:: WW1_Mem_Beg01_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player began memorial with
     option 1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iBeginningComplete = GetLocalInt(OBJECT_SELF, "iBeginningComplete");

    if (iBeginningComplete == 1)
    {
        return TRUE;
    }
    return FALSE;
}
