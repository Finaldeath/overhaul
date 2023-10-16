//::///////////////////////////////////////////////
//:: act_mom_noarmour
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mommaji unequips Enivid's armour
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oArmour = GetItemInSlot(INVENTORY_SLOT_CARMOUR);
    if(GetIsObjectValid(oArmour))
    {
        ActionUnequipItem(oArmour);
    }
}
