// action-taken for J'Nah: attack player if did not ask to kill dragon

#include "nw_i0_generic"

void main()
{
    if(GetLocalInt(GetModule(),"X1_JNAHPLOT") == 10)
        return; // player agreed to fight the dragon.

    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    SetIsTemporaryEnemy(oPC);
    //SpeakString("ATTACK! ATTACK!");
    DetermineCombatRound(oPC);
    int n = 1;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
    while(oEnemy != OBJECT_INVALID)
    {
        n++;
        if(GetStringLeft(GetTag(oEnemy), 14) == "Q3_DAEMONFEY" || GetTag(oEnemy) == "Q3_QUEMOZENG" || GetTag(oEnemy) == "NW_HELLHOUND")
            AssignCommand(oEnemy, DetermineCombatRound());
        oEnemy = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
    }

}
