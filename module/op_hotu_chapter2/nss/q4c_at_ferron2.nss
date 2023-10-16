// rebel golems attack

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
    object oSilver1 = GetNearestObjectByTag("q4c_SilverGolem", OBJECT_SELF, 1);
    object oSilver2 = GetNearestObjectByTag("q4c_SilverGolem", OBJECT_SELF, 2);
    DelayCommand(1.0, AssignCommand(oSilver1, DetermineCombatRound()));
    DelayCommand(2.0, AssignCommand(oSilver2, DetermineCombatRound()));

    int i = 1;
    float fDelay = 2.0;
    object oBronze = GetNearestObjectByTag("q4c_BronzeGolem", OBJECT_SELF, i);
    while(oBronze != OBJECT_INVALID)
    {
        AssignCommand(oBronze, SetFacingPoint(GetPosition(oPC)));
        fDelay += 1.0;
        DelayCommand(fDelay, Attack(oBronze));
        i++;
        oBronze = GetNearestObjectByTag("q4c_BronzeGolem", OBJECT_SELF, i);
    }

}
