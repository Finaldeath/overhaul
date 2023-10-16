//:://////////////////////////////////////////////////
//:: Evil Aribeth, Interjection (Condition Script)
//:: H2c_AriE_Interj.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil and has an
     interjection to make right now.

     Based off of x0_d2_hen_inter.nss
 */
//:://////////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////////
#include "x0_i0_henchman"

int StartingConditional()
{
    int iAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
    if (iAlignment == ALIGNMENT_EVIL)
    {
        return GetHasInterjection(GetPCSpeaker());
    }
    return FALSE;
}
