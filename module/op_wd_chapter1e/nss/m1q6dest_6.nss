#include "NW_I0_GENERIC"
void DestroyAllUndead()
{
    effect eDeath = EffectDeath(TRUE,FALSE);
    object oUndead = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE,RACIAL_TYPE_UNDEAD);
    while(GetIsObjectValid(oUndead))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oUndead);
        oUndead = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE,RACIAL_TYPE_UNDEAD);
    }
}
void main()
{
    if(GetCurrentHitPoints() < 900)
    {

        SurrenderToEnemies();
        if(GetPlotFlag() == FALSE)
        {
            SetPlotFlag(OBJECT_SELF,TRUE);
            SetLocalInt(OBJECT_SELF,"NW_L_Surrender",1);
        }
        ClearAllActions();
        SpeakOneLinerConversation();
        DestroyAllUndead();
        if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
            GiveXPToCreature(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), 300);
        }
    }
    else

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
