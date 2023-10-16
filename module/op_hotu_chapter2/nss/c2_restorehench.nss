//::///////////////////////////////////////////////
//:: c2_restorehench
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Restores the henchmen from chapter 1
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////
#include "x2_inc_globals"

void main()
{

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        ExecuteScript("x2_c2_start", oPC);
    }
}
