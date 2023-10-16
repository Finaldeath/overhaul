#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    RemoveEffectByType(oPC, EFFECT_TYPE_VISUALEFFECT);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC);
}
