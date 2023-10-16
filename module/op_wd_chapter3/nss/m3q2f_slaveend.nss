//::///////////////////////////////////////////////
//:: M3Q2F_SLAVEEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Applies effect at end of conversation
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    effect eVis =  EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    RemoveEffect(OBJECT_SELF, eVis);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
}
