//:://////////////////////////////////////////////////
//:: Evil Aribeth, I Just Died (Condition Script)
//:: H2c_AriE_Died.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil and has died
     while hired by this player.

     Based off of x0_d2_hen_died.nss
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
        if (GetKilled(GetPCSpeaker()) && GetDidDie())
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
