//::///////////////////////////////////////////////
//:: Name  act_q1dkobold_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   PC has traded himself for the hostage.
   Fade to Black - Remove (temporarily) and henchmen
   and associates.
   Flip teleport the cook and the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    //Integer for conversation
    SetLocalInt(OBJECT_SELF, "nPCHostage", 1);
    SetLocalInt(GetPCSpeaker(), "Lodar_Job", 1);
    SetLocalInt(GetModule(), "X1_Q1DPCHOSTAGE", 1);


    object oPC = GetPCSpeaker();
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oCook = GetObjectByTag("q1dcook");
    object wpPC = GetWaypointByTag("wp_q1d_pchostage");
    object wpShaman = GetWaypointByTag("wp_q1d_shaman");
    object wpCook = GetWaypointByTag("wp_q1d_cooksafe");

    //For cooks conversation
    SetLocalInt(oCook, "nFreed", 1);

    object oSound = GetObjectByTag("snd_q1dscream");
    SoundObjectStop(oSound);
    DestroyObject(oSound);

    FadeToBlack(oPC);
    DelayCommand(2.0, BlackScreen(oPC));
    object oHenchman = GetHenchman(oPC);
    if (oHenchman != OBJECT_INVALID)
    {
        SetLocalObject(oPC, "Q1DHENCHMAN", oHenchman);
        FireHenchman(oPC, oHenchman);

    }
    // Destroy associates.
    if(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC), 2.0);

    DelayCommand(1.7, AssignCommand(oCook, ActionForceMoveToObject(wpCook, FALSE, 1.0, 0.5)));
    DelayCommand(1.8, AssignCommand(oShaman, JumpToObject(wpShaman)));
    DelayCommand(2.5, AssignCommand(oPC, ActionJumpToObject(wpPC)));
    DelayCommand(4.0, FadeFromBlack(oPC));
    DelayCommand(3.5, AssignCommand(oShaman, ActionStartConversation(oPC)));
}
