#include "help_general"

void main()
{
    object oKara = OBJECT_SELF;
    effect eVisual = GetFirstEffect(oKara);

    while (GetIsEffectValid(eVisual) == TRUE)
    {
        RemoveEffect(oKara, eVisual);
        eVisual = GetNextEffect(oKara);
    }

    eVisual = EffectVisualEffect(VFX_IMP_DEATH);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oKara);
}
