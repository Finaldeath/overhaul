// Player attacks the scout

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    DetermineCombatRound(oPC);
}
