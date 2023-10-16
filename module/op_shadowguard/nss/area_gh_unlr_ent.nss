#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oWP = GetNearestObjectByTag("WP_ST_0_NC_HENCH_TARIN", oPC);

            object oTarin = CreateHenchman(oPC, "HENCH_TARI", GetLocation(oWP));

            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), oTarin));

            SceneSpeak(oPC, "[You seem to have stumbled upon some sort of underground lair...]");
        }
    }
}
