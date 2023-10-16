#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        if (GetFirstTimeIn())
            SceneSpeak(oPC, "[You notice the bodies of Imperial guards lying all around in pools of their own blood...  It seems the followers of the Crimson Prophet have begun their attack on the Docks...]");
}
