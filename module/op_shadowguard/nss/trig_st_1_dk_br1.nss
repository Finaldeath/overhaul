#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            SceneSpeak(oPC, "[As if only to complicate matters further, you see a group of Crimson Followers emerge from the other side of the debris, taking fire upon any who would attempt to clear the bridge's path...]");
        }
    }
}
