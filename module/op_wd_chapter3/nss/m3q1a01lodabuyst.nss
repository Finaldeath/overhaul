//::///////////////////////////////////////////////
//:: Does Player have enough to buy drink
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = HasGold(1, GetPCSpeaker());
    return iResult;
}