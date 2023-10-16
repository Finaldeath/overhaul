#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    object oWP = GetWaypointByTag("WP_GH_SEW_TPDR");
    location lWP = GetLocation(oWP);

    SceneSpeak(oPC, "[You slowly raise yourself up the rope to the sewers above...]");

    DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lWP)));
}
