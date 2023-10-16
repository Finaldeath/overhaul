//::///////////////////////////////////////////////
//:: Name q2fs_endcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Duergar Slaving Party attacks PC at end of conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 16/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oChief = OBJECT_SELF;
    object oDuergar1 = GetObjectByTag("q2fs_rogue1");
    object oDuergar2 = GetObjectByTag("q2fs_rogue2");
    object oDuergar3 = GetObjectByTag("q2fs_rogue3");

    ChangeToStandardFaction(oChief, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDuergar1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDuergar2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDuergar3, STANDARD_FACTION_HOSTILE);

    AssignCommand(oChief, DetermineCombatRound());
    AssignCommand(oDuergar1, DetermineCombatRound());
    AssignCommand(oDuergar2, DetermineCombatRound());
    AssignCommand(oDuergar3, DetermineCombatRound());
}
