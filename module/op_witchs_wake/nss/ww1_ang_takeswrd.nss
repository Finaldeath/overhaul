//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Take Sword
//:: WW1_Ang_TakeSwrd.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Angmar takes 100 gp and the rusted sword from
     the player and equips it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oSword = GetItemPossessedBy(oPC, "ww1_gravesword");

    //Take 100 gp. Leave it in his inventory for pickpockets.
    TakeGoldFromCreature(100, oPC);

    //Take axe.
    ActionTakeItem(oSword, oPC);

    //Equip axe while polishing it.
    ActionEquipItem(oSword, INVENTORY_SLOT_RIGHTHAND);
}
