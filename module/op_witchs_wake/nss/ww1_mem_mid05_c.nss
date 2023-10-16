//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Middle = 05
//:: WW1_Mem_Mid05_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player chose option 5 for the
     middle of the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMiddleComplete = GetLocalInt(OBJECT_SELF, "iMiddleComplete");

    if (iMiddleComplete == 5)
    {
        return TRUE;
    }
    return FALSE;
}
