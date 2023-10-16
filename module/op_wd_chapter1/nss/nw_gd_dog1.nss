//::///////////////////////////////////////////////
//:: Heartbeat
//:: NW_GD_DOG1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"NW_L_Intruder");
    object oHome = GetNearestObjectByTag("WP_GUARDDOG");

    if (GetIsObjectValid(oIntruder) &&
        GetDistanceToObject(oIntruder) > 3.0)
    {
        ClearAllActions();
        ActionMoveToObject(oIntruder,TRUE);
        ActionDoCommand(PlayVoiceChat(VOICE_CHAT_BATTLECRY1));
        ActionDoCommand(PlayAnimation(ANIMATION_FIREFORGET_TAUNT));
    }
    else if (GetIsObjectValid(oIntruder) &&
             GetDistanceToObject(oIntruder) <= 3.0)
    {
        PlayAnimation(ANIMATION_FIREFORGET_TAUNT);
        PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
    }
    else if (!GetIsObjectValid(oIntruder) &&
             GetDistanceToObject(oHome) > 3.0)
    {
        ClearAllActions();
        ActionMoveToObject(oHome,FALSE,1.9);
    }
    else
    {
        SetFacing(GetFacing(oHome));
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
