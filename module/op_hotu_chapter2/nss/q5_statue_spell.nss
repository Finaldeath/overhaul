// Petrified statue spell-cast event: attack player

#include "nw_i0_generic"

void main()
{
    int nSpell = GetLastSpell();
    object oCaster = GetLastSpellCaster();

    if(nSpell == SPELL_STONE_TO_FLESH)
    {
        ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
        DetermineCombatRound(oCaster);
    }

    ExecuteScript("nw_c2_defaultb", OBJECT_SELF);
}
