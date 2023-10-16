// this script will have to be changed so that Nyphithys turns
// into an erinye (succubus with angel wings)

#include "NW_I0_GENERIC"
void main()
{
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound();
}
