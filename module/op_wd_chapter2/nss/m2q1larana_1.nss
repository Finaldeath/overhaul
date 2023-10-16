//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q1larana_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 9, 2002
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
           IsInConversation(OBJECT_SELF) == FALSE)
    {
        if (GetLocalInt(oPC,"NW_L_M2LaranaTalk") == 0)
        {
            nFound = TRUE;
            SetLocalInt(oPC,"NW_L_M2LaranaTalk",1);
            DelayCommand(3.0,SpeakOneLinerConversation());
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
