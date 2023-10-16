void main()
{
    int nSpellCast = GetLastSpell();
    object oWay;
    effect eVis;

    if(nSpellCast == SPELL_FIREBALL)
    {
        eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
        oWay = GetWaypointByTag("NW_2Q4D_EXPLOSION_1");
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));
        oWay = GetWaypointByTag("NW_2Q4D_EXPLOSION_2");
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));
    }
}
