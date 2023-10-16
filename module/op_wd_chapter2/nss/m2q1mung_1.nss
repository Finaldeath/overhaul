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
    object oDoor = GetObjectByTag("M2Q1M_M2Q1A");

    if (GetLocalInt(GetModule(),"M2Q1A00SAILPLOT") >= 20 &&
        GetLocalInt(OBJECT_SELF,"NW_L_Leave") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Leave",10);
        ActionMoveToObject(oDoor,FALSE,1.9);
        ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
        ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
        DelayCommand(10.0,DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
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
