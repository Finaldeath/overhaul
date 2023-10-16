#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        object oKey = GetItemPossessedBy(oPC, "IT_PLOT_014");

        if (oKey != OBJECT_INVALID)
        {
            SceneSpeak(oPC, "[You use the key Shrak gave you to open the lock on the trapdoor.]");

            SetLocked(OBJECT_SELF, FALSE);

            DestroyObject(oKey);
        }

        if (GetLocked(OBJECT_SELF) == FALSE)
        {
            object oWP = GetWaypointByTag("WP_GHAA_BLHK_LAIR");
            location lWP = GetLocation(oWP);

            SceneSpeak(oPC, "[You see a rope leading down from the trapdoor, and use it to gently lower yourself into its depths...]");

            DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lWP)));
        }

        else
            SceneSpeak(oPC, "[This trapdoor appears to be tightly shut and locked...  You'll have to find the proper key to open it.]");

    }

}
