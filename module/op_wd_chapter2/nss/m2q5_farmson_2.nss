//::///////////////////////////////////////////////
//:: Default On Percieve
//:: m2q5_farmson_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
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
                SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                DetermineCombatRound();
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention
            else if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION) && GetIsPC(GetLastPerceived()))
            {
                ActionStartConversation(OBJECT_SELF);
            }
            else if (GetIsPC(GetLastPerceived()) &&
                     GetLocalInt(GetLastPerceived(),"NW_L_FarmsonInfo") == 0)
            {
                ActionStartConversation(GetLastPerceived());
            }
        }
    }
    //If the last perception event was hearing based or if someone vanished then go to search mode
    else if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        //if(!TalentSeeInvisible())
        //{
            object oGone = GetLastPerceived();
            if(GetAttemptedAttackTarget() == GetLastPerceived() || GetAttemptedSpellTarget() == GetLastPerceived())
            {
                DetermineCombatRound();
                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
                {
                    ActionMoveToLocation(GetLocation(oGone), TRUE);
                }
            }
        //}
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
