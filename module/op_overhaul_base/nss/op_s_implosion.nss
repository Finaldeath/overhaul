//::///////////////////////////////////////////////
//:: Implosion
//:: op_s_implosion.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Cleric 9
    Innate Level: 9
    School: Evocation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Short
    Area of Effect / Target: Medium
    Duration: Instant
    Additional Counter Spells:
    Save: Fortitude Negates
    Spell Resistance: Yes

    The caster creates a vortex of destruction that tears asunder all living
    things within its area of effect, killing them instantly unless they make
    their saving throw. This can include the caster and their allies.

    Unlike other instant death spells this one bypasses immunity to death spells
    since the summoned vortex kills the creature not the spell itself. The
    spell also does not use a saving throw vs. death.

    Implosion has no effect on creatures in gaseous form or on incorporeal
    creatures.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eImplode = EffectVisualEffect(VFX_FNF_IMPLOSION);
    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lTarget);

    // Bypass magical immunity
    effect eDeath = SupernaturalEffect(EffectDeath(TRUE));

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
    while (GetIsObjectValid(oTarget))
    {
        // Unlike Bioware's this affects the caster too, why a vortex wouldn't wh. knows...
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            if (!GetIsIncorporeal(oTarget))
            {
                float fDelay = GetRandomDelay(0.4, 1.2);

                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    // Unlike Bioware's this one isn't "versus Death" and no bonus +3 randomly to the save DC
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                    {
                        //Apply death effect and the VFX impact
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    }
                }
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lTarget);
    }
}
