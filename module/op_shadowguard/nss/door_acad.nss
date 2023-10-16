#include "help_general"

void main()
{
    if (GetLocked(OBJECT_SELF))
    {
        object oPC = GetFirstPC();

        SceneSpeak(oPC, "[You must complete the Ritual of Rakha and accept your honors as a graduate of the Imperial Academy before leaving this chamber...]");
    }
}
