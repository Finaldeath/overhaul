//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q2G_Cultist_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 9, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_CultistJourFound") == 1)
    {
        DestroyObject(OBJECT_SELF);
    }
    if(GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY, FALSE);
        if(TalentAdvancedBuff(40.0))
        {
            return;
        }
    }

    if(GetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING))
    {
        int nDay = FALSE;
        if(GetIsDay() || GetIsDawn())
        {
            nDay = TRUE;
        }
        if(GetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT") != nDay)
        {
            if(nDay == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", TRUE);
            }
            else
            {
                SetLocalInt(OBJECT_SELF, "NW_GENERIC_DAY_NIGHT", FALSE);
            }
            WalkWayPoints();
        }
    }

    if(!GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            if(!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
            {
                if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && !IsInConversation(OBJECT_SELF))
                {
                    if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN))
                    {
                        PlayMobileAmbientAnimations();
                    }
                    else if(GetIsEncounterCreature() &&
                    !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                    {
                        PlayMobileAmbientAnimations();
                    }
                    else if(GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS) &&
                       !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                    {
                        PlayImmobileAmbientAnimations();
                    }
                }
                else
                {
                    DetermineSpecialBehavior();
                }
            }
            else
            {
                //DetermineCombatRound();
            }
        }
    }
    else
    {
        if(GetSpawnInCondition(NW_FLAG_SLEEPING_AT_NIGHT))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }
}
