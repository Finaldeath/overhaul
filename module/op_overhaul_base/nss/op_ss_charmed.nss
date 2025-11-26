//:://////////////////////////////////////////////
//:: Charmed State Script
//:: op_ss_charmed
//:://////////////////////////////////////////////
/*
    This heartbeat script fires when EffectCharmed is the highest priority state
    applied to a creature.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    // SpeakString("Charm State Script");

    SetCommandable(TRUE);

    DetermineCombatRound();

    SetCommandable(FALSE);
}
