//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Male Condition (Normal Int)
//:: WW1_Hag_Male_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is male (Normal
     Int Variant)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);

    if (iGender = GENDER_MALE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
