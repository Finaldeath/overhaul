//::///////////////////////////////////////////////
//:: Drunken stumbling Heartbeat
//:: M3Q1_STUMBLE_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people stumble drunkenly, then get up.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: March 11, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nRand = Random(3);

    if (nRand == 0)
    {
        ClearAllActions();
        PlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0,7.0);
    }
/*    else if(nRand==1)
    {
        ClearAllActions();
        PlayAnimation(ANIMATION_FIREFORGET_BOW,1.0,7.0);
    }*/
    else
    {
        ClearAllActions();
        PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0,7.0);
    }
    if(!GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
    {
        if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) &&
           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
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
    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }
}
