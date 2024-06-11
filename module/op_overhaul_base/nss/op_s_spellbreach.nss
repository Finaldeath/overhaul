//::///////////////////////////////////////////////
//:: Spell Breach
//:: op_s_spellbreach.nss
//:://////////////////////////////////////////////
/*
    Lesser Spell Breach

    This spell strips an enemy mage of up to two magical defenses, including
    Spell Mantles, Globes of Invulnerability, Stoneskins, Premonition,
    Protection from Elements, Ghostly and Ethereal Visage, Mage Armor,
    Shadow Shield and Elemental Shield. This spell will also reduce the
    target creature's SR by 3 for ten rounds.

    Greater Spell Breach

    Same except 4 defences and lowers SR by 5.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nTotal = nSpellId == SPELL_GREATER_SPELL_BREACH ? 4 : 2;
    int nSR = nSpellId == SPELL_GREATER_SPELL_BREACH ? 5 : 3;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        DoSpellBreach(oTarget, nTotal, nSR);
    }
}

