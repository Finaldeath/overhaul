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
    if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
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
/*            else if (GetIsPC(GetLastPerceived()) &&
                     (GetGender(GetLastPerceived()) == GetGender(OBJECT_SELF) ||
                     GetAbilityScore(GetLastPerceived(),ABILITY_CHARISMA) < 10) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_WitlessTalk") == 0 &&
                     GetLocalInt(GetLastPerceived(),"NW_ELAITH_PLOT") >= 2 &&
                     GetIsObjectValid(GetNearestObjectByTag("M2Q1CWITL")))
            {
                SetLocalInt(OBJECT_SELF,"NW_L_WitlessTalk",10);
                ActionStartConversation(GetObjectByTag("M2Q1CWITL"));
            }*/
            else if (GetIsPC(GetLastPerceived()) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_MutaminTalk") == 0 &&
                     GetLocalInt(GetModule(),"NW_G_ZamithraRobbed") == 10 &&
                     GetIsObjectValid(GetNearestObjectByTag("M2Q05CMUTAMIN")))
            {
                SetLocalInt(OBJECT_SELF,"NW_L_MutaminTalk",10);
                ActionStartConversation(GetObjectByTag("M2Q05CMUTAMIN"));
            }
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetLastPerceptionSeen())
        {

        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
