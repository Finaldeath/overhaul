//::///////////////////////////////////////////////
//:: Summon Familiar and Animal Companion
//:: op_f_famanicom
//:://////////////////////////////////////////////
/*
    Summons the Familiar or Animal Companion.

    This allows us to add feats such as bonuses for them.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    switch (nSpellId)
    {
        case SPELLABILITY_SUMMON_FAMILIAR:
        {
            SummonFamiliar(oCaster);
        }
        break;
        case SPELLABILITY_SUMMON_ANIMAL_COMPANION:
        {
            SummonAnimalCompanion(oCaster);
        }
        break;
        default:
            Debug("[op_f_famanicom] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        break;
    }

    // Can add more bonuses here...
}

