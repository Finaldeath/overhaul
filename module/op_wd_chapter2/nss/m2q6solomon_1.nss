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

    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") < 2 &&
            GetDistanceToObject(oPC) > 5.0)
        {
            ClearAllActions();
            ActionMoveToObject(oPC);
        }
        else if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") < 2 &&
                 GetDistanceToObject(oPC) > 0.0 &&
                 GetDistanceToObject(oPC) < 6.0)
        {
            ClearAllActions();
            ActionStartConversation(oPC);
        }
        else if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") == 2 &&
                 GetDistanceToObject(oPC) > 0.0 &&
                 GetDistanceToObject(oPC) < 10.0)
        {
            ClearAllActions();
            ActionStartConversation(OBJECT_SELF);
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
