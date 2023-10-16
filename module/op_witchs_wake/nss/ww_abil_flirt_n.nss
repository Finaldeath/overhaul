//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Flirt, Normal Int
//:: WW_Abil_Flirt_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is of the opposite
    gender than the NPC and of normal
    Intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Sept 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iPCGender = GetGender(oPC);
    int iNPCGender = GetGender(OBJECT_SELF);

    if (iPCGender != iNPCGender)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
