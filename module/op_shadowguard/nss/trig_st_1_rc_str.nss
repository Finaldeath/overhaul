#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SceneSpeak(oPC, "[It appears the stairs leading to the main floor of the tavern were destroyed along with most of the building...]");
    }
}
