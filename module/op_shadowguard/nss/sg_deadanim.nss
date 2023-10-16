#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0f, 300.0f));
}
