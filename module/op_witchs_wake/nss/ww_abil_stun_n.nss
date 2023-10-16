//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Stunning Fist, Normal Int
//:: WW_Abil_Stun_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is a Monk or is
    currently capable of using the Stunning Fist
    feat through some other means. Normal
    Intelligence variant.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Sept 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iMonk = GetLevelByClass(CLASS_TYPE_MONK, oPC);
    int bHasStun = GetHasFeat(FEAT_STUNNING_FIST, oPC);

    if (iMonk >0 || bHasStun == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
