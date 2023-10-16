//::///////////////////////////////////////////////
//:: Knower of Places, Yellow Lighting (Condition Script)
//:: H5c_Places_Yello.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Yellow lighting scheme is
     now active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bYellow = GetLocalInt(OBJECT_SELF, "bRingSwap");
    if (bYellow == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
