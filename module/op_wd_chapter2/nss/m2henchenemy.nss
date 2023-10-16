#include "NW_I0_GENERIC"

void main()
{
    RemoveHenchman(GetPCSpeaker());
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    DetermineCombatRound();
}
