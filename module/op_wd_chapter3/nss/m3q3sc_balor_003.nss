//::///////////////////////////////////////////////
//:: Check Intelligence Low, Player has Bulls Strength Potion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() &&
    GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3D_SUCCUBUS"));
}


