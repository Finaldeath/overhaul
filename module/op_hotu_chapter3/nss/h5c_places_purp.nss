//::///////////////////////////////////////////////
//:: Knower of Places, Purple Lighting (Condition Script)
//:: H5c_Places_Purp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Purple lighting scheme is
     still active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bYellow = GetLocalInt(OBJECT_SELF, "bRingSwap");
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bYellow == FALSE &&
        bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}

