//:://////////////////////////////////////////////////
//:: Good Aribeth, Not My Master (Condition Script)
//:: H2c_AriG_MasterX.nss
//:: Copyright (c) 2003 BioWare Corp.
//:://////////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good and has been
     hired out to another player.

     Based off of x0_d2_hen_ohired.nss
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
        // this checks to see if the henchman is considered currently
        if  (GetIsHired() && !GetWorkingForPlayer(GetPCSpeaker()) &&
                GetLocalInt(OBJECT_SELF, "X0_L_BUSY_SPEAKING_ONE_LINER") == 0)
        {
            SetLocalInt(OBJECT_SELF, "X0_L_BUSY_SPEAKING_ONE_LINER", 0);
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
