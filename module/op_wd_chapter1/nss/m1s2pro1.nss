#include "NW_I0_Generic"
void main()
{
    if(GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
        if(d10() > 6)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        }
    }
}
