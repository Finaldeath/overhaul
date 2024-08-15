//::///////////////////////////////////////////////
//:: Earthquake
//:: op_s_earthquake.nss
//:://////////////////////////////////////////////
/*
    The caster causes a massive earthquake around themselves, causing 10d6
    points of bludgeoning damage to all creatures in the area of effect. If
    they fail the reflex save they are also knocked down for 2 rounds. In
    addition any spellcaster must make a concentration skill check (DC the
    spell save DC) or lose their current spell. The caster is not affected
    by the earthquake.

    So it's not quite SRD but not quite useless like NWN1. NWN2 did some
    reasonable changes (although not in the description!) but we'll standardise
    on having it all based on the spell save DC.

    No spell resistance + concentration check + reflex save should make some
    mages weap I guess.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE2);
    // We might want to apply this repeating every round for people who come into view? Also need some more fancy VFXs to go with it...
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, GetLocation(oCaster));

    int nVis = VFX_IMP_HEAD_NATURE;
    // Extraordinary effects since they're "natural" and no SR applies
    effect eLink         = EffectLinkEffects(EffectKnockdown(),
                                             EffectIcon(EFFECT_ICON_KNOCKDOWN));
    eLink                = ExtraordinaryEffect(eLink);
    effect eSpellFailure = ExtraordinaryEffect(EffectSpellFailure(100));

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        if (oTarget != OBJECT_SELF)
        {
            SignalSpellCastAt();

            float fDelay = GetRandomDelay(0.1, 0.5);

            // Reflex save
            int bSaved = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay);

            int nDamage = GetDiceRoll(10, 6);

            nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bSaved);

            // Damage
            if (nDamage > 0)
            {
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
                DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }

            // Knockdown
            if (!bSaved)
            {
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 12.0));
            }

            // Spellcasting Concentration Check
            if (GetCurrentAction(oTarget) == ACTION_CASTSPELL)
            {
                SendMessageToPC(oCaster, "They're casting a spell " + GetName(oTarget));
                // Can't get what spell it is (or type) but whatever it is we're concentrating checking it
                if (!GetOpposingSkillCheck(oTarget, oCaster, SKILL_CONCENTRATION, nSpellSaveDC))
                {
                    // Not delayed since it might be almost cast! Also the spell failure shouldn't affect
                    // spell abilties and feats, I think, so it's just pure spells.
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eSpellFailure, oTarget, 6.0);
                }
            }
        }
    }
}
