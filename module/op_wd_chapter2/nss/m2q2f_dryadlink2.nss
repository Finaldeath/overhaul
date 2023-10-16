//::///////////////////////////////////////////////
//:: Damaged
//:: M2Q2F_DryadLink2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the dryad gets damaged, the dryad's tree
    feels the damage as well.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 3, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    object oTree = GetNearestObjectByTag("M2Q2PTREEDRYAD1");

    int nDamage = GetCurrentHitPoints(oTree) - GetCurrentHitPoints(OBJECT_SELF);

    if (nDamage > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(nDamage),oTree);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_NATURE),oTree);
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
                            if(TalentSeeInvisible())
                            {
                            }
                            else
                            {
                                ActionMoveToLocation(GetLocation(oTarget), TRUE);
                                ActionDoCommand(DetermineCombatRound());
                            }
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
