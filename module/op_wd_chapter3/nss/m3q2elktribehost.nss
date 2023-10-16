//::///////////////////////////////////////////////
//:: Checks if Elk Tribe Hostile or Neutral
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If player has not gotten as escort.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = !GetElkTribePeaceful(GetPCSpeaker());
    return iResult;
}

