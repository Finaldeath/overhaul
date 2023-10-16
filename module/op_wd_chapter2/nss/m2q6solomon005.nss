#include "NW_I0_GENERIC"

void main()
{
    object oGuard1 = GetNearestObjectByTag("M2Q6CSOLOGRD",OBJECT_SELF,1);
    object oGuard2 = GetNearestObjectByTag("M2Q6CSOLOGRD",OBJECT_SELF,2);

    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
    AssignCommand(oGuard1,DetermineCombatRound());
    AssignCommand(oGuard2,DetermineCombatRound());
    DetermineCombatRound();
}
