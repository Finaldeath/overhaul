//::///////////////////////////////////////////////
//:: Cleanup AOE Effect
//:: op_rs_aoecleanup.nss
//:://////////////////////////////////////////////
/*
    This will remove the run script's AOE through the use of AOECheck() in the
    interval check.

    Apply to the entering creatures with ApplyAOEPersistentRunScriptEffect() and
    see AOECheck() for further details.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    AOECheck();
}

