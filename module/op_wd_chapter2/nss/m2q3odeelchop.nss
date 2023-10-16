//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3OdeelChop
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Odeel chops down the tree.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 27, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    ActionAttack(GetNearestObjectByTag("M2Q2PLDRUIDTREE"));
    ActionDoCommand(WalkWayPoints());
}
