//::///////////////////////////////////////////////
//:: Enter
//:: SpawnBessada
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 13, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oWaypoint = GetObjectByTag("WP_Bessada_Spawn");
    location lWaypoint = GetLocation(oWaypoint);

    if (GetIsPC(oEntered))
    {
        if (GetLevelByPosition(1,oEntered) + GetLevelByPosition(2,oEntered) + GetLevelByPosition(3,oEntered) < 10)
        {
            CreateObject(OBJECT_TYPE_CREATURE,"bessada",lWaypoint);
        }
        else
        {
            CreateObject(OBJECT_TYPE_CREATURE,"bessada2",lWaypoint);
        }
        DestroyObject(OBJECT_SELF);
    }
}
