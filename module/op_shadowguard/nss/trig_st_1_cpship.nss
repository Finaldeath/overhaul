#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        if (GetFirstTimeIn())
            SceneSpeak(oPC, "[It appears the Crimson Prophet has already made his escape via ship...]");
}
