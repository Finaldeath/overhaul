//::///////////////////////////////////////////////
//:: Default On Damaged
//:: NW_C2_DEFAULT6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_TrollsAttacked") == 0)
    {
        ClearAllActions();
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_TrollsAttacked",10);
    }
    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                {
                    DetermineSpecialBehavior(GetLastAttacker());
                }
                else if(GetIsObjectValid(GetLastAttacker()))
                {
                    DetermineCombatRound();
                }
            }
            else
            {
                object oTarget = GetAttackTarget();
                object oAttacker = GetLastAttacker(OBJECT_SELF);
                if (GetIsObjectValid(oAttacker) && (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                    GetHitDice(oAttacker) >= GetHitDice(oTarget) )  && oTarget != oAttacker && GetIsEnemy(oAttacker) )
                {
                  //ClearAllActions();
                  DetermineCombatRound(oAttacker);
                }
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1006));
    }
}
