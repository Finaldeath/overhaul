//::///////////////////////////////////////////////
//:: Sleeping Man, Equip Amulet (Action Script)
//:: H3a_SMan_EquipAm.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the player to equip the Sensei's
     Amulet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oAmulet = GetItemPossessedBy(oPC, "H2_SenseiAmulet");
    ActionPauseConversation();
    AssignCommand(oPC, ActionEquipItem(oAmulet, INVENTORY_SLOT_NECK));
    ActionResumeConversation();
}

