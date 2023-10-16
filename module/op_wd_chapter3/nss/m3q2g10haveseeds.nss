//::///////////////////////////////////////////////
//:: M3Q2G10HaveSeeds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the player has the Ultarg
    Seeds.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = HaveUltargSeeds(GetPCSpeaker());
    return iResult;
}
