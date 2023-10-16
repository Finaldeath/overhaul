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
                if (GetLocalInt(OBJECT_SELF,"NW_First_Perceived") == 0)
                {
                    SetLocalInt(OBJECT_SELF,"NW_First_Perceived",1);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SUPER_HEROISM),OBJECT_SELF);
                    DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),OBJECT_SELF));
                }
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
