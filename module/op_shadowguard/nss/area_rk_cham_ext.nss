#include "help_general"

void main()
{
    object oPC = GetExitingObject();

    RemoveEffectByType(oPC, EFFECT_TYPE_VISUALEFFECT);
}
