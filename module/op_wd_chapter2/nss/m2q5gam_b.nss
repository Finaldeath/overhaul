//::///////////////////////////////////////////////
//:: Default: On Spell Cast At
//:: m2q5gam_b
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This determines if the spell just cast at the
    target is harmful or not.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    object oCaster = GetLastSpellCaster();
    if(GetLastSpellHarmful())
    {
        if(
         !GetIsObjectValid(GetAttackTarget()) &&
         !GetIsObjectValid(GetAttemptedSpellTarget()) &&
         !GetIsObjectValid(GetAttemptedAttackTarget()) &&
         GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN))
        )
        {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
            {
                DetermineSpecialBehavior(oCaster);
            }
            else
            {
                DetermineCombatRound(oCaster);
            }
            //Shout Attack my target, only works with the On Spawn In setup
            SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
            //Shout that I was attacked
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        }
    }
    if (GetLocalInt(OBJECT_SELF,"NW_L_Move") == 20 &&
        GetCurrentHitPoints() > 10 &&
        GetIsPC(oCaster))
    {
        DelayCommand(1.0,ActionStartConversation(oCaster));
    }
}
