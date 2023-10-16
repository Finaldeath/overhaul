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
    if (GetLocalInt(OBJECT_SELF,"NW_L_Heartbeat") == 0)
    {
        if (GetLocalInt(GetModule(),"NW_G_WanevAlarm") == 1 &&
            GetLocalInt(OBJECT_SELF,"NW_L_MoveToGong") == 0 &&
           !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY,OBJECT_SELF,1,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN)))
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF,"NW_L_MoveToGong",1);
            ActionMoveToObject(GetWaypointByTag("WP_MOVETOGONG_01"),TRUE);
            ActionOpenDoor(GetObjectByTag("M2Q3DAD_M2Q3DAC"));
            ActionJumpToObject(GetWaypointByTag("WP_MOVETOGONG_02"));
            ActionMoveToObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_A_WanevGong"),TRUE);
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_MoveToGong",0));
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
