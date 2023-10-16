#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP = GetWaypointByTag("WP_ST_1_DOCKS_BY_BOAT");
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));

    DelayCommand(12.0, SceneSpeak(oPC, "[You arrive along the edge of the docks a short while later, and quickly emerge from the small boat...]"));
}
