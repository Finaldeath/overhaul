// formians attack player, and formian crystal is destroyed.

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    SetIsTemporaryEnemy(oPC, OBJECT_SELF);
    DetermineCombatRound(oPC);

    float fDelay = 0.0;
    int n = 1;
    object oFormian = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, OBJECT_SELF, n);
    while(oFormian != OBJECT_INVALID)
    {
        DelayCommand(fDelay, AssignCommand(oFormian, ClearAllActions()));
        DelayCommand(fDelay, AssignCommand(oFormian, ActionForceMoveToObject(OBJECT_SELF, TRUE, 10.0, fDelay * 10.0)));
        DelayCommand(fDelay, AssignCommand(oFormian, ActionAttack(oPC)));
        fDelay += 0.2;
        n++;
        oFormian = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, OBJECT_SELF, n);
    }

    oPC = GetFirstPC();
    object oCrystal;
    while(oPC != OBJECT_INVALID)
    {
        oCrystal = GetItemPossessedBy(oPC, "q3_formcrystal");
        if(oCrystal != OBJECT_INVALID)
        {
            DestroyObject(oCrystal);
            return;
        }
        oPC = GetNextPC();
    }
}
