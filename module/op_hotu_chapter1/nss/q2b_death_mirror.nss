//::///////////////////////////////////////////////
//:: Name q2b_death_mirror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
If the mirror is destroyed, it spawns two copies of the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 13/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCopy") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nCopy", 1);

    location lMirror = GetLocation(OBJECT_SELF);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    object oCopy1 = CopyObject(oPC, lMirror, OBJECT_INVALID, "q2bclone1");
    object oCopy2 = CopyObject(oPC, lMirror, OBJECT_INVALID, "q2bclone2");

    //Create the heartbeat object to keep the clones attacking
    object oHeart = CreateObject(OBJECT_TYPE_PLACEABLE, "q2bclonehb", lMirror);
    //Make sure the copies don't drop anything
    object oGear = GetItemInSlot(INVENTORY_SLOT_ARMS, oCopy1);


    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_ARROWS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BELT, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BOOTS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BULLETS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_CHEST, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_CLOAK, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_HEAD, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_NECK, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    //create a back up dagger - in case the PC didn't have any melee weapons
    object oDagger = CreateItemOnObject("nw_wswmdg008", oCopy1);
    SetDroppableFlag(oDagger, FALSE);


object oGear2 = GetItemInSlot(INVENTORY_SLOT_ARMS, oCopy2);


    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_ARROWS, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_BELT, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_BOLTS, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_BOOTS, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_BULLETS, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_CHEST, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_CLOAK, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
         SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_HEAD, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
         SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_NECK, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
        SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
         SetDroppableFlag(oGear2, FALSE);
    }
    oGear2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCopy2);
    if(GetIsObjectValid(oGear2))
    {
         SetDroppableFlag(oGear2, FALSE);
    }


    //Empty all items from copy 1's inventory
    oGear = GetFirstItemInInventory(oCopy1);
    while (oGear != OBJECT_INVALID)
    {
        SetDroppableFlag(oGear, FALSE);
        oGear = GetNextItemInInventory(oCopy1);
    }
    oGear2 = GetFirstItemInInventory(oCopy2);
    while (oGear2 != OBJECT_INVALID)
    {
        SetDroppableFlag(oGear2, FALSE);
        oGear2 = GetNextItemInInventory(oCopy2);
    }
    ChangeToStandardFaction(oCopy1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oCopy2, STANDARD_FACTION_HOSTILE);
    int nGold1 = GetGold(oCopy1);
    TakeGoldFromCreature(nGold1, oCopy1, TRUE);
    int nGold2 = GetGold(oCopy2);
    TakeGoldFromCreature(nGold2, oCopy2, TRUE);

    //create a back up dagger - in case the PC didn't have any melee weapons
    object oDagger2 = CreateItemOnObject("nw_wswmdg008", oCopy2);
    SetDroppableFlag(oDagger2, FALSE);

    AssignCommand(oCopy1, ActionEquipMostDamagingMelee());
    AssignCommand(oCopy2, ActionEquipMostDamagingMelee());

    AssignCommand(oCopy1, DetermineCombatRound(oPC));
    AssignCommand(oCopy2, DetermineCombatRound(oPC));

}
