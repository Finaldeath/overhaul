//::///////////////////////////////////////////////
//:: M3Q2B_UNCASFEATH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player already has Uncas' feather
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////
#include "m3plotinclude"
int StartingConditional()
{
    int iResult;

    iResult = DoesPlayerHaveShamanFeather(GetPCSpeaker())==FALSE;
    return iResult;
}
