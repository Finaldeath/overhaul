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
    int nRand = Random(4);

    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        switch (nRand)
        {
            case 0:
                PlayAnimation(ANIMATION_FIREFORGET_DRINK);
            break;
            case 1:
                PlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
            break;
            case 2:
                PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
            break;
            case 3:
                PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
            break;
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
            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }
    }
}
