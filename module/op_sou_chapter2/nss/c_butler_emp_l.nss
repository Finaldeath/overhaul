//::///////////////////////////////////////////////
//:: Stone Butler (Condition - Emporium, Low Int)
//:: C_Butler_Emp_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has heard the guardian golems advertise
     their maker (Low Int variant).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 26, 2003
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEmporium = GetLocalInt(oPC, "bGolemEmporium");

    if (bEmporium == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
