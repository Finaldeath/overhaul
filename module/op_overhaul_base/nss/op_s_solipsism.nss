//::///////////////////////////////////////////////
//:: Solipsism
//:: op_s_solipsism.nss
//:://////////////////////////////////////////////
/*
    You manipulate the senses of one creature so that it perceives itself to be
    the only real creature in all of existence and everything around it to be
    merely an illusion.

    If the target fails its save, it is convinced of the unreality of every
    situation it might encounter. It takes no actions, not even purely mental
    actions, and instead watches the world around it with bemusement. The
    subject becomes effectively paralyzed and takes no steps to defend itself
    from any threat, since it considers any hostile action merely another
    illusion.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = EffectLinkEffects(EffectCutsceneParalyze(),
                   EffectLinkEffects(EffectIcon(EFFECT_ICON_PARALYZE),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_AURA_PULSE_YELLOW_WHITE),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_MIND_SPELLS, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
                {
                    ApplyVisualEffectToObject(VFX_IMP_HEAD_ODD, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
                }
            }
        }
    }
}

