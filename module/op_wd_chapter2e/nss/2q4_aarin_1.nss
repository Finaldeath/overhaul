//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if (GetLocalInt(OBJECT_SELF,"NW_L_CH2E_TALK") == 0 &&
        GetDistanceToObject(oPC) < 15.0 &&
        GetDistanceToObject(oPC) > 0.0)
    {
        SpeakOneLinerConversation();
    }
    if(GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        if(TalentAdvancedBuff(30.0))
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
            if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) && !IsInConversation(OBJECT_SELF))
            {
                if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN))
                {
                    if(!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
                    {
                        PlayMobileAmbientAnimations();
                    }
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
            if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1001));
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
}
