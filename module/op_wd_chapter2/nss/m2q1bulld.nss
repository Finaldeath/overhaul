void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q1BULL");
    location lWaypoint = GetLocation(oWaypoint);
    SetFacing(GetFacing(oWaypoint));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE),lWaypoint);
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
}
