//::///////////////////////////////////////////////
//:: Name con_cynn2*
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does the pc have Thomas's Ring?
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(), "q2a1ring");
    if (GetIsObjectValid(oRing) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oRing", oRing);
        return TRUE;
    }
    return FALSE;
}
