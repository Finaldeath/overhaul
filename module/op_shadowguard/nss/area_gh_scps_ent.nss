#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SceneSpeak(oPC, "[You seem to have stumbled upon some sort of secret passage under the Imperial District...]");

        object oHench = GetHenchman(oPC);

        if (oHench != OBJECT_INVALID)
        {
            if (GetLocalInt(OBJECT_SELF, "N_HENCH_WARN") == 0 && GetTag(oHench) == "HENCH_LYEN")
            {
                SceneSpeak(oHench, "We should be wary, " + GetName(oPC) + ".  This appears to be an escape passage from the Grand Hall, and may be laden with traps.");

                SetLocalInt(OBJECT_SELF, "N_HENCH_WARN", 1);
            }
        }
    }
}
