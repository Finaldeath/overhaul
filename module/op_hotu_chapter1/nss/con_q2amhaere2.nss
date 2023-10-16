//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Checks to see if player spoke to Mhaere already, but
 Tamsil is't gone yet.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = MhaereWontRentRoom(GetPCSpeaker());
    return iResult;
}
