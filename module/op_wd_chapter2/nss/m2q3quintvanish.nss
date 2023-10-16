//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3QuintVanish
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Quint vanishes from sight.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 29, 2001
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY),OBJECT_SELF,2.0));
    DestroyObject(OBJECT_SELF,11.0);
}
