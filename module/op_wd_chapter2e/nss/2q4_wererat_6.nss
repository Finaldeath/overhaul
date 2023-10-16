//::///////////////////////////////////////////////
//:: Default On Damaged
//:: 2q4_wererat_6
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
    if(GetIsPC(GetLastDamager()))
    {
        object oGregor = GetNearestObjectByTag("2Q4_GateGuard");
        if(GetIsObjectValid(oGregor))
        {
            SetLocalInt(oGregor,"Helped_Gregor", 1);
        }
    }
    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                {
                    DetermineSpecialBehavior(GetLastAttacker());
                }
                else if(GetIsObjectValid(GetLastDamager()))
                {
                    DetermineCombatRound();
                    if(!GetIsFighting(OBJECT_SELF))
                    {
                        object oTarget = GetLastDamager();
                        if(!GetObjectSeen(oTarget))
                        {
                            ActionMoveToLocation(GetLocation(oTarget), TRUE);
                            ActionDoCommand(DetermineCombatRound());
                        }
                    }
                }
            }
            else if (!GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                object oTarget = GetAttackTarget();
                object oAttacker = GetLastAttacker(OBJECT_SELF);
                if (
                       ( GetIsObjectValid(oAttacker) ) &&
                       ( GetTotalDamageDealt() > GetMaxHitPoints(OBJECT_SELF) / 4 ) ||
                       ( GetHitDice(oAttacker) >= GetHitDice(oTarget) )  &&
                       ( oTarget != oAttacker ) &&
                       ( GetIsEnemy(oAttacker) )
                   )
                {
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
