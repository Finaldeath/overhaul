//::///////////////////////////////////////////////
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
        default:
            Debug("[op_ip_onhit] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        break;
    }
}

