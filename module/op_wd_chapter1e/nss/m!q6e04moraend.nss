#include "NW_I0_Plot"
void main()
{
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,OBJECT_SELF);
    DestroyObject(OBJECT_SELF,0.5f);
    PlayOldTheme();
}
