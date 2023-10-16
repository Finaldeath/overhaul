//::///////////////////////////////////////////////
//:: Default On Percieve
//:: NW_C2_DEFAULT2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //This is the equivalent of a force conversation bubble, should only be used if you want an NPC
    //to say something while he is already engaged in combat.
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION) && GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SpeakOneLinerConversation();
    }
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
            {
                DetermineSpecialBehavior();
            }
            else if(GetIsEnemy(GetLastPerceived()))
            {
                SetFacingPoint(GetPosition(GetLastPerceived()));
                DetermineCombatRound();
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention
            else if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION) && GetIsPC(GetLastPerceived()))
            {
                ActionStartConversation(OBJECT_SELF);
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 20 && GetIsPC(GetLastPerceived()))
            {
                ClearAllActions();
                ActionStartConversation(OBJECT_SELF);
                ActionDoCommand(DelayCommand(1.0,SignalEvent(OBJECT_SELF,EventUserDefined(500))));
            }
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetObjectSeen(GetLastPerceived()) && GetIsEnemy(GetLastPerceived()))
        {
            if(GetLocalObject(OBJECT_SELF, "NW_HEARD_OBJECT_" + GetTag(OBJECT_SELF)) != GetLastPerceived())
            {
                vector vPosition = GetPosition(GetLastPerceived());
                SetFacingPoint(vPosition);
                ActionEquipMostDamagingRanged();
                ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
                ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
                SetLocalObject(OBJECT_SELF, "NW_HEARD_OBJECT_" + GetTag(OBJECT_SELF), GetLastPerceived());
            }
            else
            {
                DetermineCombatRound(GetLastPerceived());
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
