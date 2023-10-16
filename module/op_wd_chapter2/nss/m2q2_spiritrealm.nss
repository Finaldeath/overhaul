//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q2_SpiritRealm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the Spirit has been killed, play som effects.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 16, 2002
//:://////////////////////////////////////////////

void main()
{
    location lAltar = GetLocation(GetObjectByTag("M2Q2G_Grove"));
    location lWaypoint1 = GetLocation(GetObjectByTag("WP_SpiritDead1"));
    location lWaypoint2 = GetLocation(GetObjectByTag("WP_SpiritDead2"));

    if (GetLocalInt(GetModule(),"NW_M2Q2E_SpiritDead") == 10)
    {
        SetLocalInt(GetModule(),"NW_M2Q2E_SpiritDead",20);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_NATURES_BALANCE),lAltar);
        DelayCommand(2.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWKILL),lAltar));
        DelayCommand(3.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lAltar));
        DelayCommand(3.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lAltar));
        DelayCommand(4.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lAltar));
        DelayCommand(6.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lWaypoint1));
        DelayCommand(9.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lWaypoint2));
        DelayCommand(12.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lAltar));
        DelayCommand(15.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lWaypoint1));
        DelayCommand(18.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_METEOR_SWARM),lWaypoint2));
    }
}
