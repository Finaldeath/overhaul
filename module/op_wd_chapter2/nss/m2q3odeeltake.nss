//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3OdeelTake
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    O'deel takes a payment of gold from the PC and
    allows him to plant trees.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 27, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"
#include "NW_I0_GENERIC"

void main()
{
    TakeGold(GetLocalInt(OBJECT_SELF,"NW_L_Payment"),GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_AllowPlanting",10);
    WalkWayPoints();
}
