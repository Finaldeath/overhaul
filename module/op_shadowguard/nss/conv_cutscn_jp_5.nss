#include "help_hench"

void main()
{
    int i = 5;

    object oPC = GetPCSpeaker();

    CutsceneJumpToWaypoint(oPC, i);
}
