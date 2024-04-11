//::///////////////////////////////////////////////
//:: Magic Missile
//:: op_s_magicmissil.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 1
    Innate Level: 1
    School: Evocation
    Descriptor(s): Force
    Component(s): Verbal, Somatic
    Range: Long
    Area of Effect / Target: Single
    Duration: Instant
    Additional Counter Spells:
    Save: None
    Spell Resistance: Yes

    The caster creates a shimmering projectile of magical force that unerringly slams into a single selected target.
    After level 1, the spell creates 1 additional missile every two caster levels, to a maximum of 5 missiles at
    level 9. Magic missiles do 1d4+1 points of damage each.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eMissile = EffectVisualEffect(VFX_IMP_MIRV);
    effect eVis     = EffectVisualEffect(VFX_IMP_MAGBLUE);

    // Calculate the delay of the VFX
    float fDelay = GetVisualEffectHitDelay(VFX_IMP_MIRV, oTarget, oCaster);

    int nMissiles = (nCasterLevel + 1) / 2;
    // Limit missiles to five
    if (nMissiles > 5)
    {
        nMissiles = 5;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        // Fire cast spell at event for the specified target
        SignalSpellCastAt(oTarget, oCaster, TRUE);

        // Make SR Check
        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            float fDeltaTime = 0.0;
            int nCnt;
            // Apply a single damage hit for each missile instead of as a single mass
            for (nCnt = 1; nCnt <= nMissiles; nCnt++)
            {
                // Roll damage 1d4 + 1
                int nDam = GetDiceRoll(1, 4, 1);

                float fTime = fDelay + fDeltaTime;
                fDeltaTime += 0.1;

                // Set damage effect
                effect eDam = EffectDamage(nDam, DAMAGE_TYPE_MAGICAL);

                // Apply the MIRV and damage effect
                DelayCommand(fTime, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                DelayCommand(fTime, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(fDeltaTime, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
            }
        }
        else
        {
            float fDeltaTime = 0.0;
            int nCnt;
            for (nCnt = 1; nCnt <= nMissiles; nCnt++)
            {
                DelayCommand(fDeltaTime, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
                fDeltaTime += 0.1;
            }
        }
    }
}
