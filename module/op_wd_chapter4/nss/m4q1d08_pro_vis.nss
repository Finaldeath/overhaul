//::///////////////////////////////////////////////
//:: M4Q1D08_PRO_VIS.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  This scripts provides a visual indicator of what this one protects against

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    if (sTag =="M4Q1D08_IMM_FIRE")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, 6.0);
    }
    else
    if (sTag =="M4Q1D08_IMM_COLD")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_FROST_L);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, 6.0);
    }
    else
    if (sTag =="M4Q1D08_IMM_ELEC")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, 6.0);
    }
    else
    if (sTag =="M4Q1D08_IMM_POIS")
    {
        effect eVis = EffectVisualEffect(VFX_IMP_POISON_L);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, 6.0);
    }
    SetCommandable(TRUE);
    ClearAllActions();
    ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 780.0);
    SetCommandable(FALSE);


}
