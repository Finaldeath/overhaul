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
    object oWaypoint = GetWaypointByTag("WP_DARKT_SIT");

    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0 && !GetIsInCombat())
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 0)
        {
            if (GetLocalInt(GetModule(),"NW_G_CharwoodEntered") == 10)
            {
                ClearAllActions();
                SetLocalInt(OBJECT_SELF,"NW_L_Moved",10);
                ActionStartConversation(OBJECT_SELF);
            }
            else
            {
                SetFacing(GetFacing(oWaypoint));
                PlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0,7.0);
            }
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
}
