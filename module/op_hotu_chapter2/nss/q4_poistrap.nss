// Special fiee trap:
// - creats an incendiary cloud
// - creates fire walls at certain positions to block escape routs.

void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGSTINK, "q4_s0_poisfoga", "q4_s0_poisfogc", "q4_s0_poisfogb");
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    effect eImpact = EffectVisualEffect(VFX_IMP_POISON_L);
    int i = 1;

    float fDistance;
    object oWP = GetNearestObjectByTag("q4_wp_poison_trap", OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 15.0)
            break;
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oWP));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oWP), RoundsToSeconds(10));
        i++;
        oWP = GetNearestObjectByTag("q4_wp_poison_trap", OBJECT_SELF, i);
    }


    eAOE = EffectAreaOfEffect(AOE_PER_WALLFIRE, "q4_s0_firewalla", "q4_s0_bladebarc");
    i = 1;
    oWP = GetNearestObjectByTag("q4_wp_trap2", OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 15.0)
            break;
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oWP), RoundsToSeconds(10));
        i++;
        oWP = GetNearestObjectByTag("q4_wp_trap2", OBJECT_SELF, i);
    }
}
