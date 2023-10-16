//::///////////////////////////////////////////////
//:: Use Torch
//:: act_exp_light
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC uses the torch to light the explosives
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L,oPC);
    object oTorch = GetItemPossessedBy(oPC,"NW_IT_TORCH001");
    if(GetTag(oItem)!="NW_IT_TORCH001")
    {
        AssignCommand(oPC,ActionUnequipItem(oItem));
        AssignCommand(oPC,ActionEquipItem(oTorch,INVENTORY_SLOT_CWEAPON_L));
    }
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0,1.0));
}
