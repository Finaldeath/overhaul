#include "help_hench"

void main()
{
    int i = 3;

    object oPC = GetPCSpeaker();

    CutsceneJumpToWaypoint(oPC, i);
}
