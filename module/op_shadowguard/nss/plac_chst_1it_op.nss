#include "help_general"

void main()
{
    object oPC = GetLastOpenedBy();

    if (GetIsPC(oPC))
        SceneSpeak(oPC, "[You may only choose one item from this chest, so make your decision wisely...]");
}
