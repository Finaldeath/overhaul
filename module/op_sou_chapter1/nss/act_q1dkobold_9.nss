//::///////////////////////////////////////////////
//:: Name act_q1dkobold_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The kobolds have been intimidated into surrender
    Fade to Black, destroy the barricade, move naked
    kobolds to the middle of the room surrounded
    by the mob.  fade in...Lodar initiates dialog.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"



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

    object oBarricade = GetObjectByTag("q1dbaricade_7");
    SetLocalInt(GetModule(), "Q1DKoboldSurrender", 1);
    SetLocalInt(OBJECT_SELF, "nPCHostage", 2);
    SetLocalInt(GetArea(OBJECT_SELF), "nKoboldDestroyed", 1);

    effect eDamage = EffectDamage(500);

    FadeToBlack(oPC);
    //Strip kobolds of weapons.
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKobold1);
    DestroyObject(oWeapon);
    oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKobold2);
    DestroyObject(oWeapon);
    oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKobold3);
    DestroyObject(oWeapon);
    oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKobold4);
    DestroyObject(oWeapon);
    //Jump players to their positions.
    DelayCommand(3.8, AssignCommand(oLodar, ActionJumpToObject(GetWaypointByTag("wp_q1dlodar"))));


    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
    DelayCommand(4.0, AssignCommand(oShaman, JumpToObject(GetWaypointByTag("wp_q1d_surrk1"))));
    DelayCommand(4.0, AssignCommand(oKobold1, JumpToObject(GetWaypointByTag("wp_q1d_surrk2"))));
    DelayCommand(4.0, AssignCommand(oKobold2, JumpToObject(GetWaypointByTag("wp_q1d_surrk3"))));
    DelayCommand(4.0, AssignCommand(oKobold3, JumpToObject(GetWaypointByTag("wp_q1d_surrk4"))));
    DelayCommand(4.0, AssignCommand(oKobold4, JumpToObject(GetWaypointByTag("wp_q1d_surrk5"))));

    DelayCommand(4.0, AssignCommand(oCook, JumpToObject(GetWaypointByTag("wp_q1d_cooksafe"))));
    DelayCommand(4.0, AssignCommand(oMob1, JumpToObject(GetWaypointByTag("wp_q1dmob1"))));
    DelayCommand(4.0, AssignCommand(oMob2, JumpToObject(GetWaypointByTag("wp_q1dmob2"))));
    DelayCommand(4.0, AssignCommand(oMob3, JumpToObject(GetWaypointByTag("wp_q1dmob3"))));
    DelayCommand(4.0, AssignCommand(oMob4, JumpToObject(GetWaypointByTag("wp_q1dmob4"))));
    DelayCommand(4.0, AssignCommand(oMob5, JumpToObject(GetWaypointByTag("wp_q1dmob5"))));
    DelayCommand(4.0, AssignCommand(oMob6, JumpToObject(GetWaypointByTag("wp_q1dmob6"))));
    DelayCommand(4.0, AssignCommand(oPC, JumpToObject(GetWaypointByTag("wp_q1dpc"))));

    DelayCommand(5.0, FadeFromBlack(oPC));
    DelayCommand(5.0, AssignCommand(oLodar, ClearAllActions(TRUE)));
    DelayCommand(5.5, AssignCommand(oLodar, ActionStartConversation(oPC)));
}


