// Mirrors damages:
// if the trap is active then increase a counter and play a visual effect

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void main()
{
    // Running only if trap is active
    if(GetLocalInt(GetArea(OBJECT_SELF), "TRAP_ACTIVE") == 1)
    {
        // deactivating mirror only if active
        if(GetLocalInt(OBJECT_SELF, "DEACTIVATED") == 0)
        {
            SetLocalInt(OBJECT_SELF, "DEACTIVATED", 1);
            //effect eVis = EffectVisualEffect(248);
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            effect eImp = EffectVisualEffect(VFX_FNF_BLINDDEAF);
            RemoveEffects(OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImp, GetLocation(OBJECT_SELF));
            int nCount = GetLocalInt(GetArea(OBJECT_SELF), "TRAP_COUNT");
            nCount++;
            SetLocalInt(GetArea(OBJECT_SELF), "TRAP_COUNT", nCount);
            SetPlotFlag(OBJECT_SELF, TRUE);
        }
    }
}
