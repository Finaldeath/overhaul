#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        SceneSpeak(oPC, "[This guard tower seems to have been plundered and destroyed by followers of the Crimson Prophet...]");
}
