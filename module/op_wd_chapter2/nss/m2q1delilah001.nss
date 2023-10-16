//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q1DELILAH001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC unequips his weapons and armor.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 16, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);
    object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD,oPC);
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    object oShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);

    AssignCommand(GetPCSpeaker(),ActionPauseConversation());
    AssignCommand(GetPCSpeaker(),ActionUnequipItem(oArmor));
    AssignCommand(GetPCSpeaker(),ActionUnequipItem(oHelm));
    AssignCommand(GetPCSpeaker(),ActionUnequipItem(oWeapon));
    AssignCommand(GetPCSpeaker(),ActionUnequipItem(oShield));
    AssignCommand(GetPCSpeaker(),ActionResumeConversation());
}
