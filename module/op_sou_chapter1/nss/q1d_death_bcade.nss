//::///////////////////////////////////////////////
//:: Name q1d_death_bcade
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy the rest of the barricade
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x0_i0_henchman"
void ReturnHenchman();

void main()
{
    //PC can no longer be a hostage if the barricade is destroyed
    SetLocalInt(GetModule(), "X1_Q1DPCHOSTAGE", 0);

    //Destroy the other barricade placeables
    int nCount;
    object oBarricade;
    effect eDamage = EffectDamage(500);
    for (nCount = 1; nCount < 7; nCount++)
    {
        oBarricade = GetObjectByTag("q1dbaricade_" + IntToString(nCount));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade);
    }


    //If kobolds didn't destroy it - then the PCs are attacking
    //so turn kobolds hostile - return henchman immediately
    if (GetLocalInt(GetArea(OBJECT_SELF), "nKoboldDestroyed") != 1)
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

        SetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED", 1);
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

        AssignCommand(oShaman, DetermineCombatRound());
        AssignCommand(oKobold1, DetermineCombatRound());
        AssignCommand(oKobold2, DetermineCombatRound());
        AssignCommand(oKobold3, DetermineCombatRound());
        AssignCommand(oKobold4, DetermineCombatRound());

        ReturnHenchman();
    }
    //else Kobolds are fleeing so delay return of the henchman
    else
    {
        DelayCommand(12.0, ReturnHenchman());
    }

}
void ReturnHenchman()
{
    //if the PC hostage had a henchman - reassign the henchman
    object oHenchman;
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        oHenchman = GetLocalObject(oPC, "Q1DHENCHMAN");
        if (oHenchman != OBJECT_INVALID)
        {
            DelayCommand(12.0, HireHenchman(oPC, oHenchman));
            SetLocalObject(oPC, "Q1DHENCHMAN", OBJECT_INVALID);
        }
        oPC = GetNextPC();
    }
}
