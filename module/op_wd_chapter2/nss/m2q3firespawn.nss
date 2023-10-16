//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: m2q3FireSpawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Placing a dried heart in the brazier spawns
    a fire creature.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 7, 2001
//:://////////////////////////////////////////////

void main()
{
    object oHeart = GetItemPossessedBy(OBJECT_SELF,"M2Q03IDRIEDHEART");
    object oWaypoint = GetWaypointByTag("WP_M2Q3FIRESPAWN");

    if (GetIsObjectValid(oHeart))
    {
        DestroyObject(oHeart);
        CreateObject(OBJECT_TYPE_CREATURE,"NW_FIRE",GetLocation(oWaypoint));
    }
}
