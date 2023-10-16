//::///////////////////////////////////////////////
//:: Spawn
//:: m2q3CharCom_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Charwood commoners will move to their last
    location when spawned in.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 29, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionForceMoveToLocation(GetLocalLocation(GetArea(OBJECT_SELF),"NW_A_CommonerSpot"));
}
