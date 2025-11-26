//:://////////////////////////////////////////////
//:: Remove Spell
//:: op_rs_removespel
//:://////////////////////////////////////////////
/*
    Removes any effects matching the same spell Id. Only should be used in the
    RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED script.

    Use primarily to clear temp HP when the primary spell is dispelled or
    removed.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    RemoveEffectsFromSpell(OBJECT_SELF, nSpellId);
}
