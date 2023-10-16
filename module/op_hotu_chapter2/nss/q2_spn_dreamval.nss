//:://////////////////////////////////////////////////
//:: q2_spn_dreamval
/*
    Spawn valsharess as ghost form
 */
//:://////////////////////////////////////////////////

//:://////////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF, "nVFXOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nVFXOnce", 1);

    effect eVis1 = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
    effect eVis2 = EffectVisualEffect(VFX_DUR_GLOW_GREY);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis1, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, OBJECT_SELF);
}
