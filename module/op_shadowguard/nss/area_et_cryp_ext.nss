#include "help_general"

void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        RemoveAllEffects(oPC);
    }
}
