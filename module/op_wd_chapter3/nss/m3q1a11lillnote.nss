//::///////////////////////////////////////////////
//:: Give Lillian's note to the player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    if (HasItem(GetPCSpeaker(), "M3Q1_A11_LIL_NOT") == FALSE)
    {
        CreateItemOnObject("M3Q1_A11_LIL_NOT", GetPCSpeaker());
    }
}
