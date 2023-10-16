//::///////////////////////////////////////////////
//:: Cloning Door (OnOpen)
//:: Op_CloningDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in a hostile clone of the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");

    if (bDoOnce == FALSE)
    {
        //Create clone
        object oPC = GetLastOpenedBy();
        object oCloneSpawn = GetNearestObjectByTag("CloneSpawn");
        location lCloneSpawn = GetLocation(oCloneSpawn);
        object oClone = CopyObject(oPC, lCloneSpawn);

        //Heal it
        int iHeal = GetMaxHitPoints(oClone) - GetCurrentHitPoints(oClone);
        effect eHeal = EffectHeal(iHeal);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oClone);

        //Make it hostile
        ChangeToStandardFaction(oClone, STANDARD_FACTION_HOSTILE);
        AssignCommand(oClone, ActionAttack(oPC));

        //Parse through inventory, making it all undroppable.
        object oItem = GetFirstItemInInventory(oClone);
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
        int iGold = GetGold(oClone);
        AssignCommand(oClone, TakeGoldFromCreature(iGold, oClone, TRUE));

        //Give it the Key item for the players to find.
        object oKey = CreateItemOnObject("winds_01_key", oClone);
        SetDroppableFlag(oKey, TRUE);

        //Flag the DoOnce as complete
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}
