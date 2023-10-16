//::///////////////////////////////////////////////
//:: Ghoul Lord Spawn In Trigger
//:: 2Q4_LordSpawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the ghoul lord.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetWaypointByTag("2Q4_LordSpawn");
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4_GHOULLORD", GetLocation(oWay));
    DestroyObject(OBJECT_SELF, 0.0);
}
