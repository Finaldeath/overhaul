//:://////////////////////////////////////////////
//::
//:: Temporarily set Talktimes to 99, will be reset at end of second conversation or if conversation aborted early
//:: If Talktimes at 99 Haedraline will explode if conversation is aborted during second encounter
//::
//:://////////////////////////////////////////////

void main()
{
  //  SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",99);
  // * No need, she should be able to keep talking -= Brent

  effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
  ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis ,OBJECT_SELF);
  eVis = EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE);
  ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}

