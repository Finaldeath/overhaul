//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #6
//:: m2q3H_Guardian6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script summons Quint and Karlat to their
    Judgement. Also destroys their Waypoints so
    they don't return to their patrols once
    summoned.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oQuint = GetObjectByTag("M2Q3J_QUINT");
    object oKarlat = GetObjectByTag("M2Q3I_KARLAT");
    object oQuintSpawn = GetObjectByTag("Spawn_m2q3H_Quint");
    object oKarlatSpawn = GetObjectByTag("Spawn_m2q3H_Karlat");
    location lQuintSpawn = GetLocation(oQuintSpawn);
    location lKarlatSpawn = GetLocation(oKarlatSpawn);

    DestroyObject(oQuint);
    DestroyObject(oKarlat);

    SetLocalInt(GetModule(),"NW_G_JharegSummons",1);
    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD),lQuintSpawn));
    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD),lKarlatSpawn));
    CreateObject(OBJECT_TYPE_CREATURE, "M2Q3J_QUINT", lQuintSpawn);
    CreateObject(OBJECT_TYPE_CREATURE, "M2Q3I_KARLAT", lKarlatSpawn);
    DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FROST_L),lQuintSpawn));
    DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FROST_L),lKarlatSpawn));
}
