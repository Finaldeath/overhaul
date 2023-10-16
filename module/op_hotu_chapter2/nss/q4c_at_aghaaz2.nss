// Aghaaz's golems attack

#include "nw_i0_generic"

void Attack(object oGolem)
{
    float fDistance = GetDistanceBetween(OBJECT_SELF, oGolem);
    if(fDistance <= 25.0)
        AssignCommand(oGolem, DetermineCombatRound());
}

void main()
{
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    DetermineCombatRound(oPC);

    object oClay1 = GetNearestObjectByTag("q4b_clay_golem", OBJECT_SELF, 1);
    object oClay2 = GetNearestObjectByTag("q4b_clay_golem", OBJECT_SELF, 2);
    DelayCommand(1.0, AssignCommand(oClay1, DetermineCombatRound()));
    DelayCommand(2.0, AssignCommand(oClay2, DetermineCombatRound()));

    int i = 1;
    float fDelay = 2.0;
    object oFlesh = GetNearestObjectByTag("NW_GOLFLESH", OBJECT_SELF, i);
    while(oFlesh != OBJECT_INVALID)
    {
        AssignCommand(oFlesh, SetFacingPoint(GetPosition(oPC)));
        fDelay += 1.0;
        DelayCommand(fDelay, Attack(oFlesh));
        i++;
        oFlesh = GetNearestObjectByTag("NW_GOLFLESH", OBJECT_SELF, i);
    }
}
