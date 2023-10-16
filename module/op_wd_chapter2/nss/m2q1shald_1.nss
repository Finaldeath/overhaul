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
    if(GetLocalInt(GetModule(),"NW_G_TookZorEar") == 10 &&
       GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 10 &&
       GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 10 &&
       GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 10 &&
       GetLocalInt(OBJECT_SELF,"NW_L_ShaldLeave") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_ShaldLeave",10);
        ActionMoveToObject(GetWaypointByTag("WP_SHALD_LEAVE"));
        // * Patch
        // * Just making sure she is able to destroy herself
        SetPlotFlag(OBJECT_SELF, FALSE);
        DelayCommand(5.0,DestroyObject(OBJECT_SELF));
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
