//::///////////////////////////////////////////////
//:: Witchwork 1: Old Man's Well, Climb Down
//:: WW1_Well_Down.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Tears message has been
     read (not necessarily by this player).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bWellActive = GetLocalInt(GetModule(), "bWellActive");

    if (bWellActive == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
