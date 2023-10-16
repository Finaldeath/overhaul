//::///////////////////////////////////////////////
//:: Name  act_q5tymo_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the Dragon chest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

void main()
{
    location lSpawn = GetLocation(GetWaypointByTag("wp_q5dragonchest"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BLIND_DEAF_M), lSpawn);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q5dragonchest", lSpawn);
}
