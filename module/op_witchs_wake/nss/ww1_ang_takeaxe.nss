//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Take Axe
//:: WW1_Ang_TakeAxe.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Angmar takes 100 gp and the rusted axe from
     the player and equips it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oAxe = GetItemPossessedBy(oPC, "ww1_graveaxe");

    //Take 100 gp. Leave it in his inventory for pickpockets.
    TakeGoldFromCreature(100, oPC);

    //Take axe.
    ActionTakeItem(oAxe, oPC);

    //Equip axe while polishing it.
    ActionEquipItem(oAxe, INVENTORY_SLOT_RIGHTHAND);
}
