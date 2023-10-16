#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP = GetWaypointByTag("WP_COR_OKAR_JUMP");

    location lWP = GetLocation(oWP);

    FadeToBlack(oPC, FADE_SPEED_FAST);

    AssignCommand(oPC, DelayCommand(3.0, JumpToLocation(lWP)));
}
