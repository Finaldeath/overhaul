#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(),GetObjectByTag("M2Q3PWANEVTOWER"),-100);
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound();
}
