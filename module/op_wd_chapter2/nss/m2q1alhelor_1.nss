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
    object oAnder = GetObjectByTag("M2Q01CANDER");

    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        if (GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") >= 30 &&
            GetLocalInt(OBJECT_SELF,"MoveToHome") == 0)
        {
            SetLocalInt(OBJECT_SELF,"MoveToHome",10);
            SetLocalInt(OBJECT_SELF,"TalkingToAnder",0);
            ActionStartConversation(oAnder);
        }
        if (GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") < 30 &&
            GetLocalInt(OBJECT_SELF,"TalkingToAnder") == 0)
        {
            SetLocalInt(OBJECT_SELF,"TalkingToAnder",10);
            DelayCommand(60.0,SetLocalInt(OBJECT_SELF,"TalkingToAnder",0));
            ActionStartConversation(oAnder);
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
