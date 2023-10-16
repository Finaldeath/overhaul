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
    object oDoor = GetObjectByTag("M2Q3DAD_M2Q3DAC");
    object oWaypoint = GetWaypointByTag("WP_MOVETOGONG");
    object oGong = GetLocalObject(GetArea(OBJECT_SELF),"NW_A_WanevGong");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Heartbeat") == 0)
    {
        if (GetLocalInt(GetModule(),"NW_G_WanevAlarm") == 1 &&
            GetLocalInt(OBJECT_SELF,"NW_L_MoveToGong") < 3 &
           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY,OBJECT_SELF,1,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN)))
        {
            if (GetLocalInt(OBJECT_SELF,"NW_L_MoveToGong") == 0)
            {
                ClearAllActions();
                ActionMoveToObject(oDoor,TRUE,2.0);
                SetLocalInt(OBJECT_SELF,"NW_L_MoveToGong",1);
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_MoveToGong") == 1)
            {
                ClearAllActions();
                ActionJumpToObject(oWaypoint);
                SetLocalInt(OBJECT_SELF,"NW_L_MoveToGong",2);
            }
            else if (GetDistanceToObject(oGong) > 5.0 &&
                     GetLocalInt(OBJECT_SELF,"NW_L_MoveToGong") == 2)
            {
                ClearAllActions();
                ActionMoveToObject(oGong,TRUE,2.0);
            }
            else
            {
                SetLocalInt(OBJECT_SELF,"NW_L_MoveToGong",3);
            }
        }
        else if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
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
}
