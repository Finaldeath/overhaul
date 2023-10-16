#include "help_hench"

void main()
{
    int i = 6;

    object oPC = GetPCSpeaker();

    CutsceneJumpToWaypoint(oPC, i);
}
