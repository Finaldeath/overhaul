//::///////////////////////////////////////////////
//:: M4_CONVEND
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

void main()
{
    ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
}
