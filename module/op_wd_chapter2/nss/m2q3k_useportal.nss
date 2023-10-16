//::///////////////////////////////////////////////
//:: Used
//:: M2Q3K_UsePortal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3KA_CRYPT");
    object oUsed = GetLastUsedBy();

    AssignCommand(oUsed,JumpToObject(oWaypoint));
}
