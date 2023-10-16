//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #7
//:: m2q3H_Guardian7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script summons Belial to the Judgment.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oBelial = GetObjectByTag("M2Q3I_BELIAL");
    object oBelialSpawn = GetObjectByTag("Spawn_m2q3H_Belial");
    location lBelialSpawn = GetLocation(oBelialSpawn);

//    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_IMPLOSION),lBelialSpawn);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE),lBelialSpawn);
    DestroyObject(oBelial);
    CreateObject(OBJECT_TYPE_CREATURE, "M2Q3I_BELIAL", lBelialSpawn);
}

