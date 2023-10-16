#include "help_hench"

void main()
{
    int i = 7;

    object oPC = GetPCSpeaker();

    CutsceneJumpToWaypoint(oPC, i);
}
