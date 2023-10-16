//::///////////////////////////////////////////////
//:: Knower of Places, Purple Lighting 2nd Time (Condition Script)
//:: H5c_Places_Purp2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Purple lighting scheme is
     still active (2nd Time Talked To).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bYellow = GetLocalInt(OBJECT_SELF, "bRingSwap");
    if (bYellow == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
