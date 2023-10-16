//::///////////////////////////////////////////////
//:: m1q2 Freedom Door
//:: m1q2_FreedomDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script identifies the imprisoned Guard,
    declares him "set free", and moves him to the
    nearest gathering point. It is placed on the
    cell door's OnOpen or OnDeath event.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 24, 2001
//:://////////////////////////////////////////////

void main()
{
    object oFreedCreature = GetNearestObjectByTag("m1q2_FormerGuard");
    SetLocalInt(oFreedCreature, "SetFree", TRUE);
    ActionStartConversation(OBJECT_SELF);
    object oWaypointNorth = GetNearestObjectByTag("m1q2_FreedNorth");
    object oWaypointSouth = GetNearestObjectByTag("m1q2_FreedSouth");
    float fDistanceNorth = GetDistanceBetween(oFreedCreature, oWaypointNorth);
    float fDistanceSouth = GetDistanceBetween(oFreedCreature, oWaypointSouth);

    if (fDistanceNorth < fDistanceSouth)
    {
        AssignCommand(oFreedCreature, ActionMoveToObject(oWaypointNorth, FALSE, 2.0));
    }
    else
    {
        AssignCommand(oFreedCreature, ActionMoveToObject(oWaypointSouth, FALSE, 2.0));
    }
}
