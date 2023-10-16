#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 10.0));

    object oCP = CreateCreatureOnWP("CT_UNIQ_NT_CRIM", oPC);

    AssignCommand(oCP, ActionMoveToObject(oPC, FALSE, 3.0));
}
