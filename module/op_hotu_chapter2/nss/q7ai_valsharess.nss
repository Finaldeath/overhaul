// Valsharess custom AI:

#include "nw_i0_generic"
#include "x0_i0_spells"
#include "x2_inc_switches"

int GetIsToughMatron()
{
    return GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT;
}

void main()
{
    object oIntruder = GetCreatureOverrideAIScriptTarget();
    ClearCreatureOverrideAIScriptTarget();
    SetCreatureOverrideAIScriptFinished();
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    // auto-save
    if(GetLocalInt(OBJECT_SELF, "AUTOSAVE") == 0)
    {
        SetLocalInt(OBJECT_SELF, "AUTOSAVE", 1);
        DoSinglePlayerAutoSave();
        if(GetIsToughMatron())
        {
            effect eHaste = EffectHaste();
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHaste, OBJECT_SELF);
        }

    }

    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    if (GetIsObjectValid(oIntruder) == FALSE)
    {
            oIntruder = GetNearestSeenOrHeardEnemy();
    }

    if (GetIsObjectValid(oIntruder) == FALSE)
    {
            oIntruder = GetLastAttacker();
    }

    if (__InCombatRound() == TRUE)
    {
        return;
    }

    __TurnCombatRoundOn(TRUE);


    if(GetHasSpell(761))
    {
        ActionCastSpellAtObject(761, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_BATTLETIDE) )
    {

        ActionCastSpellAtObject(SPELL_BATTLETIDE, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_REGENERATE))
    {
        ActionCastSpellAtObject(SPELL_REGENERATE, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetCurrentHitPoints() < 120 && GetHasSpell(SPELL_HEAL))
    {
        ActionCastSpellAtObject(SPELL_HEAL, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_WORD_OF_FAITH, oIntruder);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_DIVINE_POWER))
    {
        ActionCastSpellAtObject(SPELL_DIVINE_POWER, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_DIVINE_FAVOR))
    {
        ActionCastSpellAtObject(SPELL_DIVINE_FAVOR, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_PRAYER))
    {
        ActionCastSpellAtObject(SPELL_PRAYER, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(762))
    {
        ActionCastSpellAtObject(762, oIntruder);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    if(GetHasSpell(SPELL_GREATER_DISPELLING))
    {
        ActionCastSpellAtObject(SPELL_GREATER_DISPELLING, oIntruder);
        __TurnCombatRoundOn(FALSE);
        return;
    }

    __TurnCombatRoundOn(FALSE);
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);
    SetLocalString(OBJECT_SELF, "X2_SPECIAL_COMBAT_AI_SCRIPT", "");
    DetermineCombatRound();

}
