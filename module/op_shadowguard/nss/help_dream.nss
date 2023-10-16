#include "help_general"

void Dream1(object oPC)
{
    float offset = 12.0;
    int i;

    object oWP = GetWaypointByTag("WP_STAGE_1_JUMP");
    location lWP = GetLocation(oWP);

    SceneSpeak(oPC, "[DREAM 1 : NOT IMPLEMENTED YET]");

    DelayCommand(offset * i, SetCommandable(TRUE, oPC));

    DelayCommand(offset * i + 0.7, AssignCommand(oPC, JumpToLocation(lWP)));
}

void Dream2(object oPC)
{
    float offset = 12.0;
    int i;

    object oWP = GetWaypointByTag("WP_STAGE_2_JUMP");
    location lWP = GetLocation(oWP);

    SceneSpeak(oPC, "[DREAM 2 : NOT IMPLEMENTED YET]");

    DelayCommand(offset * i, SetCommandable(TRUE, oPC));

    DelayCommand(offset * i + 0.7, AssignCommand(oPC, JumpToLocation(lWP)));
}
