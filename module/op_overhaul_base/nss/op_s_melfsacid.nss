//::///////////////////////////////////////////////
//:: Melf's Acid Arrow
//:: op_s_melfsacid
//:://////////////////////////////////////////////
/*
    The caster targets a single creature with an acid bolt. If a ranged touch
    attack is successful the bolt hits and damages the target with 2d4 acid
    damage. Then for every additional round (up to 7 at caster level 18) 2d4
    acid damage is applied unless somehow neutralized.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    // Run script interval for damage
    if (GetLastRunScriptEffectScriptType() == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        int nDamage = GetDiceRoll(2, 4);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_ACID_S), oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ACID), oTarget);
        return;
    }
    // Main script
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);

        // Miss or hit MIRV
        ApplyVisualEffectToObject(VFX_DUR_MIRV_ACID, oTarget, (nTouch == 0));

        if (nTouch)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                int nDamage = GetDiceRoll(2, 4);
                if (nTouch == 2)
                {
                    nDamage *= 2;
                }

                float fDelay = GetVisualEffectHitDelay(VFX_DUR_MIRV_ACID, oTarget, oCaster);

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_ACID_L), oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ACID), oTarget));

                effect eLink = EffectLinkEffects(EffectRunScriptEnhanced(),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(1 + min(6, nCasterLevel/3), ROUNDS) + 1.0));
            }
        }
    }
}

