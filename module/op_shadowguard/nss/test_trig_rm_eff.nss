#include "help_general"

void main()
{
    object oPC = GetClickingObject();

    if (GetIsPC(oPC))
    {
        RemoveAllEffects(oPC);
    }
}
