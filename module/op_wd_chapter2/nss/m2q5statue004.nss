//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5statue004
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A umber hulk spawns in.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oInsect = GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSINSECT");
    location lSpawn = GetLocation(GetWaypointByTag("WP_M2Q5STATUE"));

    SetLocalInt(OBJECT_SELF,"NW_L_Talked",1);
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",1);
    DestroyObject(oInsect);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_UMBERHULK",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_UMBERHULK",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_UMBERHULK",lSpawn);
}
