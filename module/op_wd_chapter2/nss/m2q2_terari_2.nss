//::///////////////////////////////////////////////
//:: Default On Percieve
//:: M2Q2_Terari_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //This is the equivalent of a force conversation bubble, should only be used if you want an NPC
    //to say something while he is already engaged in combat.
    if(GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID3") == 0 &&
       GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") < 2 &&
       GetIsPC(GetLastPerceived()) &&
       GetLastPerceptionSeen())
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
        }
    }
    //If the last perception event was hearing based or if someone vanished then go to search mode
    else if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        object oGone = GetLastPerceived();
        if(GetAttemptedAttackTarget() == GetLastPerceived() ||
           GetAttemptedSpellTarget() == GetLastPerceived())
        {
            DetermineCombatRound();
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                ActionMoveToLocation(GetLocation(oGone), TRUE);
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
