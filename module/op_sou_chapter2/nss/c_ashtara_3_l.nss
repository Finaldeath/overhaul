//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 3, Low Int)
//:: C_Ashtara_3_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has destroyed all the golems (Low
     Int variant).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 25, 2003
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oGolem = GetNearestObjectByTag("UndrentideGolem");

    if (oGolem == OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
