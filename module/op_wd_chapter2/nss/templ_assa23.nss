#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetLastPerceived(), OBJECT_SELF, -100);

    DetermineCombatRound();

}
