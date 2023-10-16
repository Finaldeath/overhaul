#include "nw_i0_generic"

void main()
{
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);

    object o = GetFirstFactionMember(OBJECT_SELF, FALSE);

    while (o != OBJECT_INVALID && GetDistanceBetween(OBJECT_SELF, o) <= 25.0)
    {
        AssignCommand(o, DetermineCombatRound());

        o = GetNextFactionMember(OBJECT_SELF, FALSE);
    }

    DetermineCombatRound();
}
