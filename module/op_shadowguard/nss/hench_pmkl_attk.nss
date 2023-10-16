#include "nw_i0_generic"

void main()
{
    SetLocalInt(OBJECT_SELF, "N_CAN_BE_PERM_KILLED", 1);

    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);

    DelayCommand(1.0, DetermineCombatRound());
}
