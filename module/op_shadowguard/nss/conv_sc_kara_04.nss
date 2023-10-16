#include "help_general"

void main()
{
    effect eVisual = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);

    ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 0.5f, 3.0f);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisual, OBJECT_SELF);
}
