//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This checks if pc has won the book from Darkfist.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = DarkfistGavePCBook(GetPCSpeaker());
              CheckIntelligenceLow();
    return iResult;
}
