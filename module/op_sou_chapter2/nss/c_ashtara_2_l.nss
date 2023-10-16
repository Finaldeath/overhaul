//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Condition - State 2, Low Int)
//:: C_Ashtara_2_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has received the scarab key but has
     not yet destroyed all the golems (Low Int
     variant).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 25, 2003
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int bGaveKey = GetLocalInt(OBJECT_SELF, "bGaveKey");
    object oGolem = GetNearestObjectByTag("UndrentideGolem");

    if (bGaveKey == TRUE &&
        oGolem != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
