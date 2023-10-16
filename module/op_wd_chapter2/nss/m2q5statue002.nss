//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5statue002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A skeleton warrior spawns in.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oSkull = GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSSKULL");
    location lSpawn = GetLocation(GetWaypointByTag("WP_M2Q5STATUE"));

    SetLocalInt(OBJECT_SELF,"NW_L_Talked",1);
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",1);
    DestroyObject(oSkull);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD),lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SKELWARR01",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SKELWARR01",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SKELWARR01",lSpawn);
}
