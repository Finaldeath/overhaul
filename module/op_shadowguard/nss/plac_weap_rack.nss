#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
        SceneSpeak(oPC, "[You see a vast assortment of well crafted weapons upon this rack.]");

}
