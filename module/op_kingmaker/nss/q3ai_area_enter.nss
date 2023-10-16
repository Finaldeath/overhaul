//::///////////////////////////////////////////////
//:: Area Enter script
//:: q3ai_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the script to start the magic weapon conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
#include "q_include"
void main()
{
    object oPC = GetFirstPC();
    if((GetEnteringObject() == oPC)&&(os_CheckAreaEntered()))
    {
        object oCal = GetObjectByTag("os_cut_cal");
        object oJab = GetObjectByTag("os_cut_jab");
        object oKai = GetObjectByTag("os_cut_kai");
        object oTrp = GetObjectByTag("os_cut_trp");
        object oPC = GetFirstPC();
        object oBecket = GetObjectByTag("q2_sirbecket");
        object oEnivid = GetObjectByTag("q2_enivid");
        object oMW = GetItemPossessedBy(oPC,"os_magicweapon");

        if(GetIsObjectValid(oMW))
        {
            DestroyObject(oMW);
        }

        SetLocalInt(GetModule(), "OS_BECKET_VOTES",4);
        SetLocalInt(GetModule(), "OS_ENIVID_VOTES",5);

        AssignCommand(oCal,SetIsDestroyable(FALSE,FALSE,FALSE));
        AssignCommand(oJab,SetIsDestroyable(FALSE,FALSE,FALSE));
        AssignCommand(oKai,SetIsDestroyable(FALSE,FALSE,FALSE));
        AssignCommand(oTrp,SetIsDestroyable(FALSE,FALSE,FALSE));
        os_SetAreaEntered();

        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
        if(!GetIsObjectValid(oWeapon))
        {
            q3_GiveWeapon();
        }

        DelayCommand(1.0,AssignCommand(oCal,ActionStartConversation(oPC)));
        SetMaxHenchmen(4);
    }
}
