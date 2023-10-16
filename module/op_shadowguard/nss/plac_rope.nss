#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    string sTag = GetTag(OBJECT_SELF);

    object oWP = GetWaypointByTag("WP_" + sTag);

    SetMapPinEnabled(oWP, TRUE);

    location lWP = GetLocation(oWP);

    if (GetIsPC(oPC))
    {
        SceneSpeak(oPC, "[You gently raise yourself up the rope...]");
        DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(lWP)));
    }
}
