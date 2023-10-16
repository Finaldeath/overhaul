//:://////////////////////////////////////////////////
//:: Good Aribeth, I'm Currently Fired (Condition Script)
//:: H2c_AriG_Fired.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good and is currently
     fired from her position as henchman.

     Based off of x0_d2_hen_fired.nss
 */
//:://////////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////////
#include "x0_i0_henchman"

int StartingConditional()
{
    int iAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
    if (iAlignment == ALIGNMENT_GOOD)
    {
        if (!GetIsHired() && GetPlayerHasHired(GetPCSpeaker()))
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
