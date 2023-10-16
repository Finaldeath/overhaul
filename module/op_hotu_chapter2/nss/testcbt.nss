//test near main gate
#include "nw_i0_generic"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        AssignCommand(oPC, DetermineCombatRound());

}
