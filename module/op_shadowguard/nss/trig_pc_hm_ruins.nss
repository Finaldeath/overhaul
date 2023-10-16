#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SceneSpeak(oPC, "[Your home lies in the ruin of flames and ashes.  The stench of charred flesh hangs upon the wind, and it appears that all who were inside at the time of the blast, including your father, have surely perished...]");
    }
}
