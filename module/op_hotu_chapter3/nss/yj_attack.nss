// Grimgnaw's party attack

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    DetermineCombatRound(oPC);
    object oBalpheron = GetNearestObjectByTag("Balpheron");
    object oMaugrim = GetNearestObjectByTag("Maugrim");
    object oKoth = GetNearestObjectByTag("KothUthKalin");
    object oCrimson = GetNearestObjectByTag("Crimson");

    AssignCommand(oBalpheron, DetermineCombatRound());
    AssignCommand(oMaugrim, DetermineCombatRound());
    AssignCommand(oKoth, DetermineCombatRound());
    AssignCommand(oCrimson, DetermineCombatRound());
}
