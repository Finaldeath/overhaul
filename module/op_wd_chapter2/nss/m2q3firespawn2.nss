//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: m2q3FireSpawn2
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
    object oWaypoint = GetWaypointByTag("WP_M2Q3FIRESPAWN2");
    object oElemental = GetObjectByTag("M2Q03CGREATFIRE");

    if (GetIsObjectValid(oHeart) &&
        !GetIsObjectValid(oElemental) &&
        GetLocalInt(GetArea(OBJECT_SELF),"NW_A_SummonGreaterFire") == 0)
    {
        DestroyObject(oHeart);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q03CGREATFIRE",GetLocation(oWaypoint));
    }
}
