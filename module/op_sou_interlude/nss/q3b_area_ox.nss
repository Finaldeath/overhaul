// get rid of myrmarch

void main()
{
    object oCrystal = GetItemPossessedBy(GetExitingObject(), "q3_formcrystal");
    if(oCrystal != OBJECT_INVALID)
        DestroyObject(oCrystal);
    object oMyrmarch = GetLocalObject(GetArea(OBJECT_SELF), "Q3B_MYRMARCH");
    if(oMyrmarch == OBJECT_INVALID)
        return;
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oMyrmarch);
    DestroyObject(oMyrmarch);
}
