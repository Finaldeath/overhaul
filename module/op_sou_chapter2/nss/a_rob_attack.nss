//::///////////////////////////////////////////////
//:: Rob the Skeleton (Action - Attack)
//:: A_Rob_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make Rob attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 6, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    AssignCommand(OBJECT_SELF, DetermineCombatRound());
}
