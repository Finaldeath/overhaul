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
    if(GetIsPC(GetLastAttacker()))
    {
        AdjustReputation(GetLastAttacker(),OBJECT_SELF,100);
        ClearPersonalReputation(GetLastAttacker());
    }
    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
        {
            DetermineSpecialBehavior(GetLastAttacker());
        }
        else if(GetIsObjectValid(GetLastAttacker()) && !GetIsPC(GetLastAttacker()))
        {
            DetermineCombatRound();
        }
    }
    else
    {
        object oTarget = GetAttackTarget();
        object oAttacker = GetLastAttacker(OBJECT_SELF);
        if (GetIsObjectValid(oAttacker) &&
            GetIsPC(GetLastAttacker()) &&
            (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
             GetHitDice(oAttacker) >= GetHitDice(oTarget) )  && oTarget != oAttacker && GetIsEnemy(oAttacker) )
        {
          //ClearAllActions();
          DetermineCombatRound(oAttacker);
        }
    }
}
