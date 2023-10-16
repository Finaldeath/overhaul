//::///////////////////////////////////////////////
//:: Default: On Spell Cast At
//:: NW_C2_DEFAULTB
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This determines if the spell just cast at the
    target is harmful or not.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 6, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void PlotReworkSpell(object oCaster, object oTarget, int nSpellID)
{
    int n1;

    if (GetPlotFlag() == TRUE)
    {
        switch (nSpellID)
        {
            case SPELL_CHARM_PERSON:
                if (WillSave(OBJECT_SELF, 10 + GetCasterLevel(oCaster), SAVING_THROW_TYPE_MIND_SPELLS, oCaster) == 0)
                    SetIsTemporaryFriend(oCaster, oTarget, TRUE, 6.0 * (2 + (GetCasterLevel(oCaster) / 3 ) ) );
                break;

            default :
                break;
        }
    }
}

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

    PlotReworkSpell(oCaster, OBJECT_SELF, GetLastSpell());

    if(GetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1011));
    }
}
