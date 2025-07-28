//::///////////////////////////////////////////////
//:: Dispel Magic
//:: op_s_dispelmagic.nss
//:://////////////////////////////////////////////
/*
    Lesser Dispel: +5 max bonus
    Dispel Magic: +10 max bonus
    Greater Dispelling: +15 max bonus
    Mordenkainen's Disjunction: +40 max bonus plus strips protections.

    Affected spells include: Spell Mantles, Globes of Invulnerability,
    Stoneskins, Premonition, Protection from Elements, Ghostly and Ethereal
    Visage, Mage Armor, Shadow Shield and Elemental Shield.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Cap caster level and check for breach
    int bBreach = FALSE;
    switch (nSpellId)
    {
        case SPELL_LESSER_DISPEL: nCasterLevel = min(nCasterLevel, 5); break;
        case SPELL_DISPEL_MAGIC: nCasterLevel = min(nCasterLevel, 10); break;
        case SPELL_GREATER_DISPELLING: nCasterLevel = min(nCasterLevel, 15); break;
        case SPELL_MORDENKAINENS_DISJUNCTION:
            nCasterLevel = min(nCasterLevel, 40);
            bBreach      = TRUE;
            break;
    }

    int nVis = VFX_IMP_HEAD_SONIC;

    // Single target or AOE?
    if (GetIsObjectValid(oTarget))
    {
        DoDispelMagic(oTarget, nCasterLevel, nVis, 0.0, TRUE, bBreach);
    }
    else
    {
        // AOE
        ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_20, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_ITEM | OBJECT_TYPE_AREA_OF_EFFECT);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget      = GetArrayObject(jArray, nIndex);
            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20;
            DoDispelMagic(oTarget, nCasterLevel, nVis, fDelay, FALSE, bBreach);
        }
    }
}
