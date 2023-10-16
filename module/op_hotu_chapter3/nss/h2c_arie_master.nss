//:://////////////////////////////////////////////////
//:: Evil Aribeth, Yes Master? (Condition Script)
//:: H2c_AriE_Master.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil and is currently
     hired by the player.

     Based off of x0_d2_hen_master.nss
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
        int bWorking = GetWorkingForPlayer(GetPCSpeaker());
        int iNoTalk = GetLocalInt(OBJECT_SELF, "X2_PLEASE_NO_TALKING");
        if (bWorking == FALSE ||
            iNoTalk == 100)
        {
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}
