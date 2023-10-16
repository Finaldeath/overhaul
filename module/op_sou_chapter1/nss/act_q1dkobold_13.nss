//::///////////////////////////////////////////////
//:: Name act_q1dkobold_13
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the kobolds all go hostile
    Lodar and the mob are allies, attack the barricade
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");
    object oCook = GetObjectByTag("q1dcook");
    object oLodar = GetObjectByTag("q1dlodar");
    object oMob1 = GetObjectByTag("q1dmob1");
    object oMob2 = GetObjectByTag("q1dmob2");
    object oMob3 = GetObjectByTag("q1dmob3");
    object oMob4 = GetObjectByTag("q1dmob4");
    object oMob5 = GetObjectByTag("q1dmob5");
    object oMob6 = GetObjectByTag("q1dmob6");
    object oPC = GetPCSpeaker();

    //Change all factions
    ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oCook, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oLodar, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob1, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob2, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob3, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob4, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob5, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob6, STANDARD_FACTION_COMMONER);

    object oBarricade = GetObjectByTag("q1dbaricade_7");

    DelayCommand(1.0, AssignCommand(oMob1, ActionAttack(oBarricade)));
    DelayCommand(1.5, AssignCommand(oMob2, ActionAttack(oBarricade)));
    DelayCommand(1.0, AssignCommand(oMob3, ActionAttack(oBarricade)));
    DelayCommand(1.2, AssignCommand(oMob4, ActionAttack(oBarricade)));
    DelayCommand(1.7, AssignCommand(oMob5, ActionAttack(oBarricade)));
    DelayCommand(1.0, AssignCommand(oMob6, ActionAttack(oBarricade)));

    AssignCommand(oShaman, ActionAttack(oPC));
    AssignCommand(oKobold1, ActionAttack(oPC));
    AssignCommand(oKobold2, ActionAttack(oPC));
    AssignCommand(oKobold3, ActionAttack(oPC));
    AssignCommand(oKobold4, ActionAttack(oPC));

    AssignCommand(oShaman, DetermineCombatRound());
    AssignCommand(oKobold1, DetermineCombatRound());
    AssignCommand(oKobold2, DetermineCombatRound());
    AssignCommand(oKobold3, DetermineCombatRound());
    AssignCommand(oKobold4, DetermineCombatRound());
}
