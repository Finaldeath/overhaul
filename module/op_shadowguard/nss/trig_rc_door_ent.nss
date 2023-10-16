#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_MARK", oPC) == 2)
        {
            if (GetFirstTimeIn())
            {
                SceneSpeak(oPC, "[You notice that Ganolin's Imperial soldiers have detained the guard standing over Mikel's chambers...]");

                object oDoor = GetNearestObjectByTag("DOOR_019_0_0", oPC);

                SetLocked(oDoor, FALSE);

            }
        }
    }
}
