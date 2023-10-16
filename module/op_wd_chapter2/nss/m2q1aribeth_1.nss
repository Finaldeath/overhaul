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
    int nCurrent = 1;
    int nFound = FALSE;
    object oPC;

    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,nCurrent,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN);

    while (GetIsObjectValid(oPC) &&
           nFound == FALSE &&
           IsInConversation(OBJECT_SELF) == FALSE &&
           !GetIsInCombat())
    {
        if (GetLocalInt(oPC,"NW_L_M2AribethInfo") == 0)
        {
            nFound = TRUE;
            SpeakOneLinerConversation();
        }
        else
        {
            nCurrent++;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,nCurrent,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN);
        }
    }

    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
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
