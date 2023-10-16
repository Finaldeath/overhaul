#include "help_general"

void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        RemoveEffectByType(oPC, EFFECT_TYPE_VISUALEFFECT);
    }
}
