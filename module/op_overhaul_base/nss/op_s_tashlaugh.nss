//:://////////////////////////////////////////////
//:: Tasha's Hideous Laughter
//:: op_s_tashlaugh
//:://////////////////////////////////////////////
/*
    If the target fails their saving throw they will begin laughing hysterically
    being knocked down onto the ground. They will be unable to defend themselves
    until the spell wears off. A creature whose racial type is different from
    the caster's gains a +4 bonus on its saving throw because humor doesn't
    'translate' well.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void SetLaughAnimations(object oTarget, string sAnimation);

void main()
{
    int nRunScript = GetLastRunScriptEffectScriptType();
    if (nRunScript == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        // Removes the animations after a short additional display (to cover the
        // "standing up" from the knockdown effect)
        DelayCommand(0.5, SetLaughAnimations(OBJECT_SELF, ""));
        return;
    }
    else if (nRunScript == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        PlayVoiceChat(VOICE_CHAT_LAUGH);
        return;
    }

    // Main script
    if (DoSpellHook()) return;

    // * creatures of different race find different things funny
    if (GetRacialType(oTarget) != GetRacialType(oCaster))
    {
        nSpellSaveDC -= 4;
    }

    effect eLink = EffectLinkEffects(EffectKnockdown(),
                                     EffectLinkEffects(EffectIcon(EFFECT_ICON_KNOCKDOWN),
                                                       EffectLinkEffects(EffectRunScriptEnhanced(),
                                                                         EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                                                                                           EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED)))));

    // Ignore knockdown resistance
    eLink = IgnoreEffectImmunity(eLink);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Checking if dead also because we're replacing "dead" animations
        if (!GetIsMindless(oTarget) && !GetIsDead(oTarget))
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
                {
                    // Usually 1 round/level but Bioware limited to 1d3 rounds. Might up it sometime...
                    float fDuration = GetDuration(d3(1), ROUNDS);

                    // Sets the animations
                    SetLaughAnimations(oTarget, "tlklaugh");
                    ExecuteScriptChunk("PlayVoiceChat(VOICE_CHAT_LAUGH);", oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                }
            }
        }
    }
}

void SetLaughAnimations(object oTarget, string sAnimation)
{
    ReplaceObjectAnimation(oTarget, "kdbck", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckps", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckdmg", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdbckdie", sAnimation);
    ReplaceObjectAnimation(oTarget, "gutokdb", sAnimation);
    ReplaceObjectAnimation(oTarget, "gustandb", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfnt", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntps", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntdmg", sAnimation);
    ReplaceObjectAnimation(oTarget, "kdfntdie", sAnimation);
    ReplaceObjectAnimation(oTarget, "gutokdf", sAnimation);
    ReplaceObjectAnimation(oTarget, "gustandf", sAnimation);
    ReplaceObjectAnimation(oTarget, "deadfnt", sAnimation);
    ReplaceObjectAnimation(oTarget, "deadbck", sAnimation);
}
