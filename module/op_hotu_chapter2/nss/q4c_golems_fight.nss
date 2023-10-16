// make nearby golems fight each other

#include "nw_i0_generic"

void main()
{
    object oEnter = GetEnteringObject();
    if(GetRacialType(oEnter) ==  RACIAL_TYPE_CONSTRUCT && GetMaster(oEnter) == OBJECT_INVALID)
    {
        AssignCommand(oEnter, DetermineCombatRound());
    }

}
