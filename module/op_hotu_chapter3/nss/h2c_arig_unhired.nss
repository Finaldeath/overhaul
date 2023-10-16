//:://////////////////////////////////////////////////
//:: Good Aribeth, Unhired (Condition Script)
//:: H2c_AriG_Unhired.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good and has not yet
     been hired.

     Based off of x0_d2_unhired.nss
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
        return !GetIsHired();
    }
    return FALSE;
}
