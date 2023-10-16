//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Middle = 01
//:: WW1_Mem_Mid01_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player chose option 1 for the
     middle of the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMiddleComplete = GetLocalInt(OBJECT_SELF, "iMiddleComplete");

    if (iMiddleComplete == 1)
    {
        return TRUE;
    }
    return FALSE;
}
