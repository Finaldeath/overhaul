//::///////////////////////////////////////////////
//:: Checks if Elk Tribe Peaceful
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If player is being escorted to Zokan, this is true.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = GetElkTribePeaceful(GetPCSpeaker());
    return iResult;
}
