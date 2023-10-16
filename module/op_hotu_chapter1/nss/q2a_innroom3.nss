//::///////////////////////////////////////////////
//:: q2a_innroom3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the player the PRIVATE key.
    Tells the module to destroy the key in 24 Hours.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: July 2002
//:://////////////////////////////////////////////
#include "inc_plot_func"

void main()
{
    TakeGoldFromCreature(PLOT_COST_LARGE_ROOM, GetPCSpeaker(), TRUE);
    object oNewKey = plotGiveLargeKey(GetPCSpeaker());
    plotDestroyObject(oNewKey, HoursToSeconds(24));

}
