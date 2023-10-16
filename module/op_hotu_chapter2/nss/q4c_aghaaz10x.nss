//::///////////////////////////////////////////////
//:: q4c_Aghaaz10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Sets Aghaaz Global to 10 (player has heard Aghaaz's offer)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

#include "x2c2_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"Aghaaz",10);
    SetPlot("q4_aghaaz", 10);
}
