#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

        object oWP = GetWaypointByTag("WP_VOYAGER_ENTRANCE");

        location lWP = GetLocation(oWP);

        SceneSpeak(oPC, "[You open the hatch leading down into the Voyager and quickly descend within...]");

        DelayCommand(3.0, AssignCommand(oPC, JumpToLocation(lWP)));
    }
}
