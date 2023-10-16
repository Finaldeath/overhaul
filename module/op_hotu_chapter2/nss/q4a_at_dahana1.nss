// Attacks player

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(),"Dahanna_End",1);
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    bkEquipMelee();
    DetermineCombatRound(oPC);

    int i = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    while(oCreature != OBJECT_INVALID)
    {
        if(GetStringLeft(GetTag(oCreature),  3) == "q4a")
        {
            AssignCommand(oCreature, DetermineCombatRound());
            DelayCommand(12.0, AssignCommand(oCreature, bkEquipMelee()));
        }
        i++;
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    }
}
