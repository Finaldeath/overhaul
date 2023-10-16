//::///////////////////////////////////////////////
//:: Witch Wake 1: Iron Ring, Equip
//:: WW1_IRing_Equip.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the player to equip the Iron Ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oRing = GetItemPossessedBy(oPC, "ww1_ironring");

    AssignCommand(oPC, ActionEquipItem(oRing, INVENTORY_SLOT_RIGHTHAND));
}
