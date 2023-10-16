#include "help_general"

void main()
{
    string sTag = "CT_HARKON";

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_CREATURE_CREATE") == 0)
        {
            SpawnCreatureByRace(sTag, oPC);

            SetLocalInt(OBJECT_SELF, "N_DO_CREATURE_CREATE", 1);
        }
    }
}
