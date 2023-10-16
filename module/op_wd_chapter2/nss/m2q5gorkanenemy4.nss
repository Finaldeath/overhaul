#include "NW_I0_GENERIC"
void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack",GetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack") + 1);
    DetermineCombatRound();
}
