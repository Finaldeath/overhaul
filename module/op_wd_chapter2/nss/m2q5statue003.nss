//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5statue003
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A blue slaad spawns in.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oFrog = GetItemPossessedBy(GetObjectByTag("M2Q5PGREENCHEST"),"M2Q05ICRYSFROG");
    location lSpawn = GetLocation(GetWaypointByTag("WP_M2Q5STATUE"));

    SetLocalInt(OBJECT_SELF,"NW_L_Talked",1);
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",1);
    DestroyObject(oFrog);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SLAADBL",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SLAADBL",lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SLAADBL",lSpawn);
}
