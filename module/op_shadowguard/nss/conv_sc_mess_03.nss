#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP = GetNearestObjectByTag("WP_EXIT");
    location lWP = GetLocation(oWP);

    AddJournalSingle("JT_ST_0_MAIN", 2, oPC);

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP, TRUE));

    DestroyObject(OBJECT_SELF, 4.0);

    // Start the second part of the cutscene
    ExecuteScript("sgcut_academy2", oPC);
}
