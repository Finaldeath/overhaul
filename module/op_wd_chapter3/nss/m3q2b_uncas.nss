//::///////////////////////////////////////////////
//:: M3Q2B_UNCAS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Uncas escapes
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 9, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oDoor = GetNearestObjectByTag("M3Q2B_GUZUDDOOR");
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
    EscapeArea();
}
