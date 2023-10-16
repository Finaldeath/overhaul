//::///////////////////////////////////////////////
//:: Percieve
//:: m2q3WanevPatrol
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function.  Guards turn hostile if they
    see an intruder without Wanev's wardstone.
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
        ActionStartConversation(OBJECT_SELF);
    }
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
                if (GetLocalInt(GetModule(),"NW_G_WanevAlarm") == 0)
                {
                    ClearAllActions();
                    ActionMoveToObject(GetNearestObjectByTag("M2Q03PGONG"));
                    ActionInteractObject(GetNearestObjectByTag("M2Q03PGONG"));
                }
                else
                {
                    DetermineCombatRound();
                }
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention
            else if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION) && GetIsPC(GetLastPerceived()))
            {
                ActionStartConversation(OBJECT_SELF);
            }
            else if (GetIsPC(GetLastPerceived()) &&
                    (!GetIsObjectValid(GetItemPossessedBy(GetLastPerceived(),"M2Q01IWARDWANEV")) ||
                     GetLocalInt(GetModule(),"NW_G_WanevAlarm") == 1))
            {
                ClearAllActions();
                ActionMoveToObject(GetNearestObjectByTag("M2Q03PGONG"));
                ActionInteractObject(GetNearestObjectByTag("M2Q03PGONG"));
                AdjustReputation(GetLastPerceived(),OBJECT_SELF,-100);
            }
        }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetLastPerceptionSeen())
        {

        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
