//::///////////////////////////////////////////////
//:: Karsus (Action - Attack)
//:: A_Karsus_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make Karsus attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    SetImmortal(OBJECT_SELF, FALSE);
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound();
}
