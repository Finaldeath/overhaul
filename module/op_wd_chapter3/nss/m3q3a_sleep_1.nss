#include "NW_I0_GENERIC"

void main()
{
    if(GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), OBJECT_SELF);
    }
}
