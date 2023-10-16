// Gargoyle trap:
// find two nearest gargoyle statues, and fire an electrical beam at the target.
// If the target has the magical helmet - fire the beam back at the statues and blow them up.

void main()
{
    object oEnter = GetEnteringObject();
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oEnter);
    int nHasHelmet = 0;
    if(GetTag(oHelmet) == "Q2_HEL_DIS")
        nHasHelmet = 1;

    // find the two statues that belongs to this trap
    object oGarg1 = GetNearestObjectByTag("Q2D_GARG1_" + GetTag(OBJECT_SELF));
    object oGarg2 = GetNearestObjectByTag("Q2D_GARG2_" + GetTag(OBJECT_SELF));

    effect eLightning1 = EffectBeam(VFX_BEAM_LIGHTNING, oGarg1, BODY_NODE_CHEST);
    effect eLightning2 = EffectBeam(VFX_BEAM_LIGHTNING, oGarg2, BODY_NODE_CHEST);
    effect eVis  = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    int nDam1 = d6(3);
    int nDam2 = d6(3);

    nDam1 = GetReflexAdjustedDamage(nDam1, oEnter, 15, SAVING_THROW_TYPE_ELECTRICITY);
    nDam2 = GetReflexAdjustedDamage(nDam2, oEnter, 15, SAVING_THROW_TYPE_ELECTRICITY);
    effect eDam1 = EffectDamage(nDam1, DAMAGE_TYPE_ELECTRICAL);
    effect eDam2 = EffectDamage(nDam1, DAMAGE_TYPE_ELECTRICAL);
    effect eDam = EffectDamage(1000); // this damage is to destroy the statues
    effect eLightning3 = EffectBeam(VFX_BEAM_LIGHTNING, oEnter, BODY_NODE_CHEST);

    if(oGarg1 != OBJECT_INVALID && GetLocalInt(oGarg1, "DISABLED") == 0) // have not been destroyed yet
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam1, oEnter);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oEnter);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning1, oEnter, 1.0);
        if(nHasHelmet)
        {
            SetLocalInt(oGarg1, "DISABLED", 1); // to avoid damage while fading out
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning3, oGarg1, 1.0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oGarg1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oGarg1);
        }
    }
    if(oGarg2 != OBJECT_INVALID && GetLocalInt(oGarg2, "DISABLED") == 0) // have not been destroyed yet
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam2,oEnter);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oEnter);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLightning2,oEnter,1.0);
        if(nHasHelmet)
        {
            SetLocalInt(oGarg2, "DISABLED", 1); // to avoid damage while fading out
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLightning3,oGarg2,1.0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oGarg2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oGarg2);
        }
    }








}

