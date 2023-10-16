void main()
{
    object oKasma = GetObjectByTag("M2Q05CKASMA");
//    SetLocalInt(GetModule(),"NW_G_M2Q5GasRoom",10);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(oKasma),DAMAGE_TYPE_FIRE),oKasma);
}
