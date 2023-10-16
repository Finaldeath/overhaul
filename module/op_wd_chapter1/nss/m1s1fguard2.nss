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
            if(GetIsEnemy(GetLastPerceived()))
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
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetObjectSeen(GetLastPerceived()))
        {
            if(GetLocalObject(OBJECT_SELF, "NW_HEARD_OBJECT_" + GetTag(OBJECT_SELF)) != GetLastPerceived() && GetIsEnemy(GetLastPerceived()))
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
