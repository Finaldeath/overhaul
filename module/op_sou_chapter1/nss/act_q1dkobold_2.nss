//::///////////////////////////////////////////////
//:: Name act_q1dkobold_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The kobolds will destroy the barricade and
    walk/run to the exit and leave...but without the cook
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void GiveExperience(object oPC);

void main()
{

    //The Players
    object oPC = GetPCSpeaker();
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");
    object oExit = GetWaypointByTag("wp_q1d_exit");
    object oBarricade = GetObjectByTag("q1dbaricade_7");
    object oSpellTarget = GetObjectByTag("q1d_spelltarget");
    //Variables
    SetLocalInt(GetArea(oPC), "nKoboldDestroyed", 1);
    SetLocalInt(GetArea(oPC), "nKoboldsFleeing", 1);
    SetLocalInt(GetPCSpeaker(), "Lodar_Job", 4);



    //Shaman will destroy the barricade and head for the door

    if (oBarricade != OBJECT_INVALID)
    {
        //effects
        effect eDamage = EffectDamage(500);
        DelayCommand(2.0, AssignCommand(oShaman, ActionCastFakeSpellAtObject(SPELL_MAGIC_MISSILE,oSpellTarget)));
        DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
        DelayCommand(12.0, AssignCommand(oShaman, ActionMoveToObject(oExit, TRUE)));
    }
    //**HACK - He needs a 12.0 second delay here for some reason - DO NOT CHANGE HACK**
    else
    {
        DelayCommand(6.0, AssignCommand(oShaman, ActionMoveToObject(oExit, TRUE)));
    }
    DelayCommand(6.0, AssignCommand(oKobold1, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold2, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold3, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold4, ActionMoveToObject(oExit, TRUE)));

    //Kobolds will head for the door
    DelayCommand(7.0, SetCommandable(FALSE, oKobold1));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold2));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold3));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold4));
    DelayCommand(13.0, SetCommandable(FALSE, oShaman));

}


