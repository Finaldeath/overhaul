//:://////////////////////////////////////////////////
//:: q3_gishnak_dam
//:: Default OnDamaged handler
/*
    CHANGE: surrender gishnak
    If already fighting then ignore, else determine
    combat round
 */
//:://////////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 26/2/2003
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nCurrentHP = GetCurrentHitPoints();
    int nMaxHP = GetMaxHitPoints();
    if(nMaxHP / nCurrentHP > 3) // surrender time
    {
        if(GetTag(GetArea(OBJECT_SELF)) == "Q3C_AncientTemple")
            return;
        SetLocalInt(OBJECT_SELF, "Q3_SURRENDERED", 1);
        // * generic surrender should only fire once
        object oPC = GetLastDamager();
        if((GetIsDead(OBJECT_SELF) == FALSE) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            DelayCommand(3.0, SetImmortal(OBJECT_SELF, FALSE));
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
            SurrenderToEnemies();
            ClearAllActions();
            //SpeakOneLinerConversation();
            SpeakStringByStrRef(40282);

            // next - have all nearby gnolls turn non-hostile and walk away a little
            int n = 1;
            object oCreature;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
            while(oCreature != OBJECT_INVALID)
            {
                n++;
                float fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
                if(fDistance > 40.0)
                    return;
                AssignCommand(oCreature, ClearAllActions());
                if(GetIsEnemy(oPC, oCreature))
                {
                    AssignCommand(oCreature, SurrenderToEnemies());
                    AssignCommand(oCreature, ActionMoveAwayFromObject(oPC, TRUE));
                }

                oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
            }
        }


    }


    if(GetFleeToExit()) {
        // We're supposed to run away, do nothing
    } else if (GetSpawnInCondition(NW_FLAG_SET_WARNINGS)) {
        // don't do anything?
    } else {
        object oDamager = GetLastDamager();
        if (!GetIsObjectValid(oDamager)) {
            // don't do anything, we don't have a valid damager
        } else if (!GetIsFighting(OBJECT_SELF)) {
            // If we're not fighting, determine combat round
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                DetermineSpecialBehavior(oDamager);
            } else {
                if(!GetObjectSeen(oDamager)
                   && GetArea(OBJECT_SELF) == GetArea(oDamager)) {
                    // We don't see our attacker, go find them
                    ActionMoveToLocation(GetLocation(oDamager), TRUE);
                    ActionDoCommand(DetermineCombatRound());
                } else {
                    DetermineCombatRound();
                }
            }
        } else {
            // We are fighting already -- consider switching if we've been
            // attacked by a more powerful enemy
            object oTarget = GetAttackTarget();
            if (!GetIsObjectValid(oTarget))
                oTarget = GetAttemptedAttackTarget();
            if (!GetIsObjectValid(oTarget))
                oTarget = GetAttemptedSpellTarget();

            // If our target isn't valid
            // or our damager has just dealt us 25% or more
            //    of our hp in damager
            // or our damager is more than 2HD more powerful than our target
            // switch to attack the damager.
            if (!GetIsObjectValid(oTarget)
                || (
                    oTarget != oDamager
                    &&  (
                         GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4)
                         || (GetHitDice(oDamager) - 2) > GetHitDice(oTarget)
                         )
                    )
                )
            {
                // Switch targets
                DetermineCombatRound(oDamager);
            }
        }
    }

    // Send the user-defined event signal
    if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DAMAGED));
    }
}
