//::///////////////////////////////////////////////
//:: Name act_q1dkobold_11
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Turn the Kobolds hostile to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oPC = GetPCSpeaker();

    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");


    //Change all factions
    ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE);

    AssignCommand(oShaman, DetermineCombatRound(oPC));
    AssignCommand(oKobold1, DetermineCombatRound(oPC));
    AssignCommand(oKobold2, DetermineCombatRound(oPC));
    AssignCommand(oKobold3, DetermineCombatRound(oPC));
    AssignCommand(oKobold4, DetermineCombatRound(oPC));

}
