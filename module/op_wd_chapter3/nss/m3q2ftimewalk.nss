//::///////////////////////////////////////////////
//:: Time Creature
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Creature randomly fades in and out
      with weird programmer effects on it.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    effect eVis =  EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}
