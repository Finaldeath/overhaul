//::///////////////////////////////////////////////
//:: Used
//:: M2Q3D_UsePortal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: May 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_WANEV_TELEPORT");
    object oUsed = GetLastUsedBy();

    AssignCommand(oUsed,JumpToObject(oWaypoint));
}

