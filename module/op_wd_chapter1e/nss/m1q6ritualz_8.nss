void main()
{
    object oDesther = GetNearestObjectByTag("Destherm1q6");
    effect eRitual = GetFirstEffect(oDesther);
    int bFound = FALSE;
    while(GetIsEffectValid(eRitual) && !bFound)
    {
        if(GetEffectType(eRitual) == EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE &&
           GetEffectCreator(eRitual) == oDesther)
        {
            RemoveEffect(oDesther,eRitual);
            bFound = TRUE;
        }
        eRitual = GetNextEffect(oDesther);
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DISPEL),oDesther);
    SetLocalInt(GetModule(),"NW_G_M1Q6DestherActive",GetLocalInt(GetModule(),"NW_G_M1Q6DestherActive") + 1);
    if(GetLocalInt(GetModule(),"NW_G_M1Q6DestherActive") >= 2)
    {
        SignalEvent(oDesther,EventUserDefined(690));
    }
}
