//::///////////////////////////////////////////////
//:: act_mom_grandpa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets rid of the magic weapon and creates a ghostly grandfather
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "q_include"
void main()
{
//Take away weapon and put it in a chest nearby.
//Create grandfather, with the new ghost effects around it
//the conversation will then have to be set up with the new creature's tag attached.
    ActionPauseConversation();
    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,"os_magicweapon");
    object oChest = GetObjectByTag("q3_mw_chest");
    object oNew = CopyItem(oItem,oChest);
    DestroyObject(oItem);
    int nPC = GetLocalInt(oPC, "OS_PCRACE");

    q3_CreateGrandpa(nPC);//creates grandfather based on PC's racial type

    ActionResumeConversation();
}
