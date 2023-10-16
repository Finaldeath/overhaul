// * Custom death for Head Gaoler
// * July 2
// * User defined death event may not always fire
void main()
{
        //* When dead change into Intellect Devourer
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    location lSpawn = GetLocation(OBJECT_SELF);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "NW_L_PATCHSPAWNID", 10) ;
    CreateObject(OBJECT_TYPE_CREATURE,"M1Q2_DEVOUR",lSpawn);
}
