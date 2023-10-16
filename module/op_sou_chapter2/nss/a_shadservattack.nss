//::///////////////////////////////////////////////
//:: Shadow Servant (Action - Attack)
//:: A_ShadServAttack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the Shadow Servant attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound();
}
