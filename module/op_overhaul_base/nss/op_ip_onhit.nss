//:://////////////////////////////////////////////
//:: Item Properties: On Hit
//:: op_ip_onhit
//:://////////////////////////////////////////////
/*
    General "On Hit" properties we can put here.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Validate the spell cast item
    if (!GetIsObjectValid(oCastItem))
    {
        if (DEBUG_LEVEL >= ERROR) Error("Item property spell being cast from a non-item: " + IntToString(nSpellId));
        return;
    }

    switch (nSpellId)
    {
        case SPELL_ITEM_FLAMING_WEAPON_PROPERTIES:
        {
            SignalSpellCastAt();

            // d4 + nLevel of damage
            int nDamage = d4() + max(1, nCasterLevel);

            ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_FIRE);
            if (nDamage < 10)
            {
                ApplyVisualEffectToObject(VFX_IMP_FLAME_S, oTarget);
            }
            else
            {
                ApplyVisualEffectToObject(VFX_IMP_FLAME_M, oTarget);
            }
        }
        break;
        case SPELL_ITEM_BLESS_BOLT:
        {
            SignalSpellCastAt();

            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                int nAppear = GetAppearanceType(oTarget);
                if (nAppear == APPEARANCE_TYPE_RAKSHASA_BEAR_MALE ||
                    nAppear == APPEARANCE_TYPE_RAKSHASA_TIGER_FEMALE ||
                    nAppear == APPEARANCE_TYPE_RAKSHASA_TIGER_MALE ||
                    nAppear == APPEARANCE_TYPE_RAKSHASA_WOLF_MALE ||
                    FindSubString(GetStringLowerCase(GetSubRace(oTarget)), "rakshasa") > -1)
                {
                    effect eDeath = EffectDeath();
                    ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                }
            }
        }
        break;
        case SPELL_ITEM_PLANAR_RIFT_BLACK_BLADE:
        {
            SignalSpellCastAt();

            // Like Bioware's we redirect the caster to be the master, since
            // it is actually "still a spell"
            oCaster = GetMaster(oCaster);

            nSpellSaveDC = 10 + nCasterLevel;

            // Check in case disconnected or something
            if (GetIsObjectValid(oCaster))
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_DEATH))
                    {
                        effect eDeath = EffectDeath(TRUE);
                        ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                    }
                }
            }
        }
        break;
        case SPELL_ITEM_PARALYZING_TOUCH_DRACOLICH:
        case SPELL_ITEM_PARALYZING_TOUCH_DEMILICH:
        {
            SignalSpellCastAt();

            int nDuration = 2;
            int nDiff = GetGameDifficulty();
            if (nDiff == GAME_DIFFICULTY_CORE_RULES )
            {
                nDuration = nSpellId == SPELL_ITEM_PARALYZING_TOUCH_DEMILICH ? 3 : 4;
            }
            else if (nDiff == GAME_DIFFICULTY_DIFFICULT)
            {
                nDuration = 5;
            }
            else if (nDiff == GAME_DIFFICULTY_VERY_EASY)
            {
                nDuration = 1;
            }
            if (nSpellId == SPELL_ITEM_PARALYZING_TOUCH_DRACOLICH)
            {
                nSpellSaveDC = 10 + GetCasterLevel(oCaster) + GetAbilityModifier(ABILITY_CHARISMA, oCaster);
            }
            else
            {
                nSpellSaveDC = 36;
            }

            if(!GetHasSpellEffect(nSpellId, oTarget))
            {
                if(!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
                {
                    effect eLink = GetEffectLink(EFFECT_TYPE_PARALYZE);
                    ApplyVisualEffectToObject(VFX_IMP_STUN, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nDuration, ROUNDS));
                }
            }
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }
}

