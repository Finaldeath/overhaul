// action-taken for gnoll chief: attack player

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, OBJECT_SELF, -100);
    AdjustReputation(OBJECT_SELF, oPC, -100);
    SetIsTemporaryEnemy(oPC);
    //SpeakString("ATTACK! ATTACK!");
    DetermineCombatRound(oPC);
    int n = 1;
    object oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
    while(oGnoll != OBJECT_INVALID)
    {
        n++;
        string sTag = GetTag(oGnoll);
        if(GetStringLeft(sTag, 8) == "Q3_GNOLL")
            AssignCommand(oGnoll, DetermineCombatRound());
        oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
    }

}
