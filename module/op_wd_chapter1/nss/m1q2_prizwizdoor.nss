#include "NW_I0_GENERIC"

void main()
{
    object oPrisWiz1 = GetNearestObjectByTag("m1q2_FormPrisWiz1");
    object oPrisWiz2 = GetNearestObjectByTag("m1q2_FormPrisWiz2");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    AdjustReputation(oPC, oPrisWiz1, -100);

    AssignCommand(oPrisWiz1, ClearAllActions());
    AssignCommand(oPrisWiz2, ClearAllActions());
    AssignCommand(oPrisWiz1, DetermineCombatRound());
    AssignCommand(oPrisWiz2, DetermineCombatRound());
}
