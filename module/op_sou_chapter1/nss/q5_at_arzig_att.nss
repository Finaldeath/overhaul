// have kobold chief attack player.

#include "nw_i0_generic"

void main()
{
    SpeakStringByStrRef(40278);
    AdjustReputation(OBJECT_SELF, GetPCSpeaker(), -50);
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -50);
    DetermineCombatRound(GetPCSpeaker());

    int n = 1;
    object oKobold = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, n);
    while(oKobold != OBJECT_INVALID)
    {
        n++;
        if(GetDistanceBetween(OBJECT_SELF, oKobold) >= 30.0)
            return;
        AssignCommand(oKobold, DetermineCombatRound(GetPCSpeaker()));
        oKobold = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, n);
    }
    SetLocalInt(GetModule(),"X1_Q5CHAMPION",0);
}
