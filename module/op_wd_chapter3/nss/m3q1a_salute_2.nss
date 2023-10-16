//::///////////////////////////////////////////////
//:: On Percieve - makes soldier salute
//:: M3Q1A_SALUTE_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function; if the perceived target is
    one of the local soldiers, she salutes.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: March 11, 2002
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
            else if(GetLastPerceived() == GetObjectByTag("M3Q1A_PATROL") || GetLastPerceived() == GetObjectByTag("SOLDIER3Q11PATRO") || GetLastPerceived() == GetObjectByTag("SOLDIER3Q12PATRO"))
            {
                ClearAllActions();
                object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                ActionUnequipItem(oWeapon);
                vector vFace = GetPosition(GetLastPerceived());
                SetFacingPoint(vFace);
                float fTime = HoursToSeconds(3);
                ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, fTime);
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
        //Will this work if I am moving to run away making noise?
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
