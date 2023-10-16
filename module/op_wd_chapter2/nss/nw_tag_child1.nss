//::///////////////////////////////////////////////
//:: Heartbeat
//:: NW_TAG_CHILD1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will make the child play a game of
    tag.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oIT = GetLocalObject(GetArea(OBJECT_SELF),"NW_A_TAG_I_AM_IT");
    object oChild = GetNearestObjectByTag("NW_TAG_CHILD");
    object oHome = GetNearestObjectByTag("WP_TAG_HOME");

    if (GetIsNight())
    {
        if (oIT == OBJECT_SELF)
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_Spawn_Tag_Game",0);
        }
        DestroyObject(OBJECT_SELF);
    }
    if (GetIsObjectValid(oIT))
    {
        if (oIT == OBJECT_SELF)
        {
            if (GetIsObjectValid(oChild))
            {
                ClearAllActions();
                SignalEvent(OBJECT_SELF,EventUserDefined(100));
            }
        }
        else
        {
            if (GetDistanceToObject(oIT) < 10.0)
            {
                ClearAllActions();
                ActionMoveAwayFromObject(oIT,TRUE);
            }
            else
            {
                if (GetDistanceToObject(oHome) > 10.0 && Random(3) == 0)
                {
                    ActionMoveToObject(oHome,TRUE);
                }
                else if(!GetHasEffect(EFFECT_TYPE_SLEEP))
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
}
