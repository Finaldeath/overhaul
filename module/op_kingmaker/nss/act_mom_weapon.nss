//::///////////////////////////////////////////////
//:: act_mom_weapon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon returns to the PC and grandpa disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oChest = GetObjectByTag("q3_mw_chest");
    object oItem = GetItemPossessedBy(oChest,"os_magicweapon");
    object oNew = CopyItem(oItem,oPC);
    object oGrandpa = GetObjectByTag("q3_grandfather");

    GetLocalInt(oPC, "OS_MOMMA_END");

    DestroyObject(oItem);
    DestroyObject(oGrandpa);
    DestroyObject(OBJECT_SELF, 0.5f);
}
