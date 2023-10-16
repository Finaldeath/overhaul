//::///////////////////////////////////////////////
//:: Name act_q1dkobold_12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Have the kobolds attack the barricade and run out into the main inn
then turn kobolds hostile
and Lodar, the cook and the mob friendly
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "nw_i0_generic"


void main()
{
    //The Players
    object oPC = GetPCSpeaker();
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

    object oSpellTarget = GetObjectByTag("q1d_spelltarget");
    object oBarricade = GetObjectByTag("q1dbaricade_7");


    object oExit = GetWaypointByTag("wp_q1d_exit");




    //AssignCommand(oShaman, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 2.0));

    if (oBarricade != OBJECT_INVALID)
    {
        effect eDamage = EffectDamage(500);
        SetLocalInt(GetArea(oPC), "nKoboldDestroyed", 1);
        DelayCommand(2.0, AssignCommand(oShaman, ActionCastFakeSpellAtObject(SPELL_MAGIC_MISSILE,oSpellTarget)));
        DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
        //**HACK - He needs a 12.0 second delay here for some reason - DO NOT CHANGE HACK**
        DelayCommand(12.0, AssignCommand(oShaman, ActionMoveToObject(oMob3, TRUE)));
    }
    else
    {
        DelayCommand(12.0, AssignCommand(oShaman, ActionMoveToObject(oMob3, TRUE)));
    }
    DelayCommand(6.0, AssignCommand(oKobold1, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold2, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold3, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold4, ActionMoveToObject(oMob3, TRUE)));
    //DelayCommand(6.0, AssignCommand(oCook, ActionMoveToObject(oExit, TRUE)));

    //Turn kobolds hostile and commoners good and start combat

    //Change all factions
    DelayCommand(15.0, ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE));
    DelayCommand(15.0, ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE));
    DelayCommand(15.0, ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE));
    DelayCommand(15.0, ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE));
    DelayCommand(15.0, ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE));
    DelayCommand(15.0, ChangeToStandardFaction(oCook, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oLodar, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob1, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob2, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob3, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob4, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob5, STANDARD_FACTION_COMMONER));
    DelayCommand(15.0, ChangeToStandardFaction(oMob6, STANDARD_FACTION_COMMONER));
    DelayCommand(16.0, AssignCommand(oShaman, DetermineCombatRound(oMob1)));
    DelayCommand(16.0, AssignCommand(oKobold1, DetermineCombatRound(oMob1)));
    DelayCommand(16.0, AssignCommand(oKobold2, DetermineCombatRound(oMob1)));
    DelayCommand(16.0, AssignCommand(oKobold3, DetermineCombatRound(oMob1)));
    DelayCommand(16.0, AssignCommand(oKobold4, DetermineCombatRound(oMob1)));
}


