//::///////////////////////////////////////////////
//:: Default On Attacked
//:: NW_C2_DEFAULT5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Polymorph") == 0)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectPolymorph(POLYMORPH_TYPE_WEREWOLF),OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"NW_L_Polymorph",10);
    }
    if(!GetFleeToExit())
    {
        if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
        {
            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetIsObjectValid(GetLastAttacker()))
                {
                    if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
                    {
                        AdjustReputation(GetLastAttacker(), OBJECT_SELF, -100);
                        SetSummonHelpIfAttacked();
                        DetermineSpecialBehavior(GetLastAttacker());
                    }
                    else
                    {
                        SetSummonHelpIfAttacked();
                        DetermineCombatRound();
                    }
                    //Shout Attack my target, only works with the On Spawn In setup
                    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
                    //Shout that I was attacked
                    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                }
            }
        }
        else
        {
            //Put a check in to see if this attacker was the last attacker
            //Possibly change the GetNPCWarning function to make the check
            SetSpawnInCondition(NW_FLAG_SET_WARNINGS, FALSE);
        }
    }
    else
    {
        ActivateFleeToExit();
    }
    if(GetSpawnInCondition(NW_FLAG_ATTACK_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1005));
    }
}
