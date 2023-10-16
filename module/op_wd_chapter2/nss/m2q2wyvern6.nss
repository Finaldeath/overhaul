//::///////////////////////////////////////////////
//:: Default On Damaged
//:: m2q2wyvern6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 13, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"M2Q1WyvernDialogue") < 2 ||
        GetLocalInt(OBJECT_SELF,"M2Q1WyvernAmbush") < 2)
    {
        SetLocalInt(OBJECT_SELF,"M2Q1WyvernDialogue",2);
        SetLocalInt(OBJECT_SELF,"M2Q1WyvernAmbush",2);
    }

    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                {
                    DetermineSpecialBehavior(GetLastDamager());
                }
                else if(GetIsObjectValid(GetLastDamager()))
                {
                    DetermineCombatRound();
                    if(!GetIsFighting(OBJECT_SELF))
                    {
                        object oTarget = GetLastDamager();
                        if(!GetObjectSeen(oTarget) && GetArea(OBJECT_SELF) == GetArea(oTarget))
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
                object oAttacker = GetLastHostileActor();
                if (GetIsObjectValid(oAttacker) && oTarget != oAttacker && GetIsEnemy(oAttacker) &&
                   (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                    (GetHitDice(oAttacker) - 2) > GetHitDice(oTarget) ) )
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
