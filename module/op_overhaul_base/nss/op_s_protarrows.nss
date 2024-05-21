//::///////////////////////////////////////////////
//:: Protection from Arrows
//:: op_s_protarrows.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard/Sorcerer 2
    Innate Level: 2
    School: Abjuration
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 1 minute / Level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    The warded creature gains resistance to ranged weapons. The subject gains
    damage reduction 10/+1 against ranged weapons. It ignores the first 10
    points of damage each time it takes damage from a ranged weapon, though a
    weapon with a +1 enhancement bonus or any magical attack bypasses the
    reduction. The damage reduction increases with the caster level to 10/+2
    at 5th, 10/+3 at 10th, 10/+4 at 15th, and 10/+5 at 20th. Once the spell
    has prevented a total of 10 points of damage per caster level (maximum
    100 points), it is discharged.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Target must be a creature
    if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE)
    {
        SendMessageToPC(oCaster, "This spell can only be cast on a creature.");
        return;
    }

    // Maximum amount of protection is 100
    int nLimit = min(nCasterLevel * 10, 100);

    // Calculate damage reduction, max +5
    int nDR = min(nCasterLevel / 5 + 1, 5);

    // Scale of VFX based off target size.
    // This is experimental. Might revert to 3 set vfx files.
    // float fScale = 0.5 * fmax(StringToFloat(Get2DAString("appearance", "PREFATCKDIST", GetAppearanceType(oTarget))), 0.8);
    // SpeakString("scale: " + FloatToString(fScale));
    float fScale = GetVFXScale(oTarget);

    effect eDR   = EffectDamageReduction(10, nDR, nLimit, TRUE);
    effect eDur  = EffectVisualEffect(30001, FALSE, fScale);
    effect eCess = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eDR, eDur);
    eLink        = EffectLinkEffects(eLink, eCess);

    SignalSpellCastAt(oTarget, oCaster, FALSE);

    // Note we don't remove duplicate effects since the AC bonus won't stack since it's no longer dodge based

    // Apply the armor bonuses and the VFX impact
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, MINUTES));
}
