//::///////////////////////////////////////////////
//:: Witch Wake 1: Grave Helm, Equip
//:: WW1_GHelm_Equip.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the player to equip the Grave Helm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");

    AssignCommand(oPC, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
}
