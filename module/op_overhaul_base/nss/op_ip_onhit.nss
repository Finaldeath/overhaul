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

    switch (nSpellId)
    {
        case SPELL_ITEM_FLAMING_WEAPON_PROPERTIES:
        {
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
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }
}

