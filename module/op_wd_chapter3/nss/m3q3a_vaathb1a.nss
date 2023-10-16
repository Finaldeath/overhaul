//::///////////////////////////////////////////////
//:: Check Intelligence Normal & Bounty Writ Has
//:: M3Q3A_VAATHB1a.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low int
    and a warrent for VAATH's.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oWrit = GetItemPossessedBy(GetPCSpeaker(), "M3Q1A07WRIT");
    if(GetIsObjectValid(oWrit))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
