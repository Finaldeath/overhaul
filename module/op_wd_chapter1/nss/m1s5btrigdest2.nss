void main()
{
    object oEnter = GetEnteringObject();
    if(GetLocalInt(GetModule(),"NW_G_M1S5TreeActive") &&
       GetRacialType(oEnter) == RACIAL_TYPE_ANIMAL &&
       GetIsObjectValid(GetMaster(oEnter)) == FALSE )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),oEnter);
        DestroyObject(oEnter);
    }
}
