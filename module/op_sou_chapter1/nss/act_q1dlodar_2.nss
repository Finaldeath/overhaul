//::///////////////////////////////////////////////
//:: Name act_q1dlodar_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The kobolds will leave - without the cook.
    without surrendering..
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


    SetLocalInt(GetPCSpeaker(), "Lodar_Job", 4);
    SetLocalInt(GetArea(oPC), "nKoboldDestroyed", 1);
    SetLocalInt(GetModule(), "Q1DKoboldSurrender", 3);
    SetLocalInt(GetArea(oPC), "nKoboldsFleeing", 1);

    object oExit = GetWaypointByTag("wp_q1d_exit");

    SetCommandable(TRUE, oShaman);
    SetCommandable(TRUE, oKobold1);
    SetCommandable(TRUE, oKobold2);
    SetCommandable(TRUE, oKobold3);
    SetCommandable(TRUE, oKobold4);
    AssignCommand(oShaman, ActionMoveToObject(oExit, TRUE));
    AssignCommand(oKobold1, ActionMoveToObject(oExit, TRUE));
    AssignCommand(oKobold2, ActionMoveToObject(oExit, TRUE));
    AssignCommand(oKobold3, ActionMoveToObject(oExit, TRUE));
    AssignCommand(oKobold4, ActionMoveToObject(oExit, TRUE));

    SetCommandable(FALSE, oShaman);
    SetCommandable(FALSE, oKobold1);
    SetCommandable(FALSE, oKobold2);
    SetCommandable(FALSE, oKobold3);
    SetCommandable(FALSE, oKobold4);
}


