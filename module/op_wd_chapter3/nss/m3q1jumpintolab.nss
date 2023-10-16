//::///////////////////////////////////////////////
//:: Jump person into lab
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Only works if they have permission to use the lab.
*/
//:://////////////////////////////////////////////
//:: Created By:       Brent
//:: Created On:       November 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
 object oEntering = GetEnteringObject();
 if (GetIsObjectValid(oEntering) == TRUE && GetIsPC(oEntering) == TRUE)
 if (HasItem(oEntering,"NW_AARCL013")== TRUE || HasItem(oEntering,"M3Q1A09WHITEPOR") == TRUE)
 {
     AssignCommand(oEntering, ClearAllActions());
     AssignCommand(oEntering, JumpToObject(GetObjectByTag("M3Q1A09InLab")));
 }
}
