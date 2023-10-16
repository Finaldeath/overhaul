#include "NW_I0_GENERIC"
void main()
{
    object oGoblin1 = GetNearestObjectByTag("M2Q05CGOBLIN03",OBJECT_SELF,1);
    object oGoblin2 = GetNearestObjectByTag("M2Q05CGOBLIN03",OBJECT_SELF,2);
    object oGoblin3 = GetNearestObjectByTag("M2Q05CGOBLIN03",OBJECT_SELF,3);
    object oGoblin4 = GetNearestObjectByTag("M2Q05CGOBLIN03",OBJECT_SELF,4);

    AdjustReputation(GetLastSpeaker(),OBJECT_SELF,-100);
    AssignCommand(oGoblin1,DetermineCombatRound());
    AssignCommand(oGoblin2,DetermineCombatRound());
    AssignCommand(oGoblin3,DetermineCombatRound());
    AssignCommand(oGoblin4,DetermineCombatRound());
    DetermineCombatRound();
}
