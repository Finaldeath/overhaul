//::///////////////////////////////////////////////
//:: Default: On Spell Cast At
//:: NW_C2_DEFAULTB
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This determines if the spell just cast at the
    target is harmful or not.

    SEP27: Trying to add a little Area-of-effect IQ
    When affected will move towards the originator
    of the area effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 6, 2001
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "x2_i0_spells"

void main()
{
    object oCaster = GetLastSpellCaster();
    int nSpell = GetLastSpell();
    /*if(nSpell == SPELL_CRUMBLE)
    {
        DoShatter(OBJECT_SELF, oCaster, METAMAGIC_NONE, FALSE);
        int nMetaMagic = GetLocalInt(OBJECT_SELF,"X2_SPELL_CRUMBLE_METAMAGIC");
        DeleteLocalInt(OBJECT_SELF,"X2_SPELL_CRUMBLE_METAMAGIC");
        DoShatter(OBJECT_SELF, oCaster, nMetaMagic, FALSE);
        if(GetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT))
        {
            SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_SPELL_CAST_AT));
        }
    }*/
    if(GetLastSpellHarmful())
    {
        // * get out of an area of effect
        if (MatchAreaOfEffectSpell(GetLastSpell()) == TRUE)
        {
            ClearActions(CLEAR_NW_C2_DEFAULTB_GUSTWIND);

            // Cast Gust of Wind if we have it to clear
            // out the AOE effect.
            if (GetHasSpell(SPELL_GUST_OF_WIND) == TRUE)
            {
                ActionCastSpellAtLocation(SPELL_GUST_OF_WIND,
                                          GetLocation(OBJECT_SELF));
                ActionDoCommand(SetCommandable(TRUE));
                SetCommandable(FALSE);

                // Commenting out this return so we send the right
                // user-defined event -- NN, 12/21/2002
                // return;

            }
            else if(GetIsReactionTypeHostile(oCaster))
            {
                // Move to the caster and attack
                object oCaster = GetLastSpellCaster();
                ActionForceMoveToObject(oCaster, TRUE, 2.0);
                DelayCommand(1.2,
                             ActionDoCommand(DetermineCombatRound(oCaster)));

                // Commenting out this return so we send the right
                // user-defined event -- NN, 12/21/2002
                // return;
              }
        }
        // Not an area of effect spell, but another hostile spell.
        // If we're not already fighting someone else,
        // attack the caster.
        else if( !GetIsFighting(OBJECT_SELF)
                // These should all be replaced by the one check above
                // !GetIsObjectValid(GetAttackTarget()) &&
                // !GetIsObjectValid(GetAttemptedSpellTarget()) &&
                // !GetIsObjectValid(GetAttemptedAttackTarget())
                // I believe this check isn't needed here -- NN, 12/21/2002
                // GetIsObjectValid(GetNearestPerceivedEnemy(-1,-1))
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
        }

        // We were attacked, so yell for help

        //Shout Attack my target, only works with the On Spawn In setup
        SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

        //Shout that I was attacked
        SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
    }
    else
    {
        // * If there is a valid enemy nearby and a NON HARMFUL spell has been
        // * cast on me  I should call DetermineCombatRound
        // * I may be invisible and casting spells on myself to buff myself up
        // * July 14, 2003 BK
       //SpawnScriptDebugger();
        object oEnemy =GetNearestEnemy();
        if (GetIsObjectValid(oEnemy) == TRUE)
        {
            DetermineCombatRound(oEnemy);
        }
    }

    // Send the user-defined event as appropriate
    if(GetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_SPELL_CAST_AT));
    }
}
