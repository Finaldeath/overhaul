// Special gas trap:
// - creats a poisonus gas
// - creates blade barries at certain positions to block escape routs.

void main()
{
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, "q4_s0_acidfoga", "q4_s0_acidfogc", "q4_s0_acidfogb");
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    effect eImpact = EffectVisualEffect(257);
    int i = 1;

    float fDistance;
    object oWP = GetNearestObjectByTag("q4_wp_gas_trap", OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 15.0)
            break;
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oWP));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oWP), RoundsToSeconds(10));
        i++;
        oWP = GetNearestObjectByTag("q4_wp_gas_trap", OBJECT_SELF, i);
    }


    eAOE = EffectAreaOfEffect(AOE_PER_WALLBLADE, "q4_s0_bladebara", "q4_s0_bladebarc");
    i = 1;
    oWP = GetNearestObjectByTag("q4_wp_trap", OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 15.0)
            break;
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oWP), RoundsToSeconds(10));
        i++;
        oWP = GetNearestObjectByTag("q4_wp_trap", OBJECT_SELF, i);
    }
}
