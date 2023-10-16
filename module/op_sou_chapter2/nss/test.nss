//::///////////////////////////////////////////////
//:: Cloning Door (OnOpen)
//:: Op_CloningDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in hostile clones of the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    int iNth = 1;
    object oPC = GetEnteringObject();
    object oCloneSpawn = GetObjectByTag("TestCloneSpawn");
    location lCloneSpawn = GetLocation(oCloneSpawn);
    object oClone;
    int iDamage;
    effect eDamage;
    object oItem;
    int iGold;
    object oKey;

    while (iNth < 10 && GetIsPC(oPC) == TRUE)
    {
        //Create clone
        oClone = CopyObject(oPC, lCloneSpawn);

        //Set it to 1 HP
        iDamage = GetCurrentHitPoints(oClone) - 1;
        eDamage = EffectDamage(iDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oClone);

        //Make it hostile
        ChangeToStandardFaction(oClone, STANDARD_FACTION_HOSTILE);
        AssignCommand(oClone, ActionAttack(oPC));

        //Parse through inventory, making it all undroppable.
        oItem = GetFirstItemInInventory(oClone);
        while (oItem != OBJECT_INVALID)
        {
            SetDroppableFlag(oItem, FALSE);
            oItem = GetNextItemInInventory(oClone);
        }
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_ARMS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_ARROWS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BELT, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BOLTS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BOOTS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BULLETS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CARMOUR, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CHEST, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CLOAK, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_HEAD, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_NECK, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oClone), FALSE);

        //Remove its gold
        iGold = GetGold(oClone);
        AssignCommand(oClone, TakeGoldFromCreature(iGold, oClone, TRUE));

        //Give it the Key item for the players to find.
        oKey = CreateItemOnObject("winds_01_key", oClone);
        SetDroppableFlag(oKey, TRUE);

        //Update the Loop variable
        iNth++;
    }
}
