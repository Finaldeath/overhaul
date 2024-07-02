//::///////////////////////////////////////////////
//:: Blackstaff: On Hit
//:: op_ip_blackstaff.nss
//:://////////////////////////////////////////////
/*
    - On striking a creature, dispel magic is cast on the target (caster check
      of 1d20 + 10).
    - On striking a creature, if they fail a Will save and SR check, then one
      prepared spell (or one unused spell slot, for spellcasters who do not
      prepare spells) of the highest spell level available will be unreadied
      and unavailable to cast.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    // NB: No spell hook.


    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Always dispel magic
        DoDispelMagic(oTarget, min(10, nCasterLevel), EffectVisualEffect(VFX_IMP_HEAD_SONIC), 0.0, TRUE);

        // Should we change the spell Id to Blackstaff?
        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
            {
                // Remove the highest level spell slot from any class
                // TODO
                ApplyVisualEffectToObject(VFX_IMP_HEAD_ODD, oTarget);
            }
        }
    }
}

