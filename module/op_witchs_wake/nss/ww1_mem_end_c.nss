//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, End Complete
//:: WW1_Mem_End_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the memorial has been
     completed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iEndComplete = GetLocalInt(OBJECT_SELF, "iEndComplete");

    if (iEndComplete > 0)
    {
        return TRUE;
    }
    return FALSE;
}
