//::///////////////////////////////////////////////
//:: Used
//:: m2q3RiddleSkel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The skeleton warrior spawns in to ask the riddle.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void CreateSkeleton(location lWaypoint)
{
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q03CSKELRIDDLE",lWaypoint);
}

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3RIDDSPAWN");
    location lWaypoint = GetLocation(oWaypoint);

    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_MaegalSpawn") == 0 &&
        GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q3HEROQUEST") < 2)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_MaegalSpawn",1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DOOM),lWaypoint);
        DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lWaypoint));
        DelayCommand(1.0,CreateSkeleton(lWaypoint));
    }
}
