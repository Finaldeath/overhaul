//::///////////////////////////////////////////////
//:: Sight Spells
//:: op_s_sight
//:://////////////////////////////////////////////
/*
    Magical sight spells like True Seeing.

    See Invisibility
    EffectSeeInvisible

    Darkvision
    EffectBonusFeat(FEAT_DARKVISION) plus +5 to spot.

    Ultravision
    EffectUltravision

    True Seeing
    EffectTrueSeeing
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    float fDuration;
    effect eLink;

    switch (nSpellId)
    {
        case SPELL_DARKVISION:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink = EffectLinkEffects(EffectBonusFeat(FEAT_DARKVISION),
                    EffectLinkEffects(EffectSkillIncrease(SKILL_SPOT, 5),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
        }
        break;
        case SPELL_ULTRAVSION:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink = EffectLinkEffects(EffectUltravision(),
                    EffectLinkEffects(EffectIcon(EFFECT_ICON_ULTRAVISION),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_ULTRAVISION),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
        }
        break;
        case SPELL_SEE_INVISIBILITY:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink = EffectLinkEffects(EffectSeeInvisible(),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_TRUE_SEEING:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink = EffectLinkEffects(EffectTrueSeeing(),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        default:
            OP_Debug("[Sight Spells] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

