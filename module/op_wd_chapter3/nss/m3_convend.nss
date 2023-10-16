//::///////////////////////////////////////////////
//:: M3_CONVEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Moves the NPC to the waypoint. Used in the
process of initiating conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May, from Aidan
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
    if(GetTag(OBJECT_SELF) == "AARINGEND3Q11")
    {
        PlayOldTheme();
    }
}
