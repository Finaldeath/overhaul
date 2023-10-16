#include "help_hench"

void main()
{
    int i = 4;

    object oPC = GetPCSpeaker();

    CutsceneJumpToWaypoint(oPC, i);
}
