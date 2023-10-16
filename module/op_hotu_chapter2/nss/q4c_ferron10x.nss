//::///////////////////////////////////////////////
//:: q4c_ferron10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Ferron Global to 10 (player has heard Ferron's offer)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"Ferron",10);
    SetPlot("q4_ferron", 10);
}
