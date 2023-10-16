//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets plot to accpeted and gives pc tower key.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());
    PetyrPlotTaken(oPC);
    CreateItemOnObject("q4ctowerkey",oPC);
}

