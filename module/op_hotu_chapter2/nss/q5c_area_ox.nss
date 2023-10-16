// tunnels on-enter: apply dead-magic zone if active

#include "x2_inc_itemprop"


void DebugString(string sStr)
{
    //PrintString(sStr);
}

void RestoreAllProperties(object oItem, object oPC, int nSlot = -1)
{
    DebugString("BOOM DEADM: TRYING to restore magic to item: <" + GetName(oItem) + "> tag= <" + GetTag(oItem) + ">");
    if(oPC != OBJECT_INVALID) // this is a pc object that has an item in inventory slot or normal inventory
    {
        if(oItem == OBJECT_INVALID)
            oItem = GetItemInSlot(nSlot, oPC);
        if(oItem == OBJECT_INVALID)
            return;
    }
    //object oChest = GetLocalObject(oItem, "ITEM_CHEST");
    // getting the key value - this points to the tag of the copy item
    string sKey = GetLocalString(oItem, "ITEM_KEY");
    // retrieving the copy item that is in this area
    object oOriginalItem = GetObjectByTag("q5c_item" + sKey);
    DebugString("BOOM DEADM: RESTORING magic for item: <" + GetName(oItem) +
        "> with key value= <" + sKey + "> for creature= <" + GetName(oPC) + ">");

    //object oOriginalItem = GetLocalObject(oChest, sKey);

    object oNewItem;
    if(oOriginalItem != OBJECT_INVALID) // item has not been restored yet
    {
        // replace current item with original
        IPCopyItemProperties(oOriginalItem, oItem);
        DestroyObject(oOriginalItem); // destroy dup item on player
        //DeleteLocalObject(oChest, GetResRef(oItem)); // so it won't be restored again
        DeleteLocalString(oItem, "ITEM_KEY");
    }
}

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        if(GetEffectType(eEff) == EFFECT_TYPE_SPELL_FAILURE || GetEffectType(eEff) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void main()
{
    object oExit = GetExitingObject();
    SetLocalInt(oExit, "Q5C_INSIDE", 0); // flagging player as outside of area (needed for load/save issues)
    if(GetObjectType(oExit) == OBJECT_TYPE_CREATURE)
    // iterate through all creature's items and if there is one in the chest, replace it with
    // the current one.
    {
        DebugString("BOOM DEADM: *** Handling RESTORE of magic from EXITING creature: <" + GetName(oExit));

        RemoveEffects(oExit);
        // Handle all items in inventory:
        object oItem = GetFirstItemInInventory(oExit);
        while(oItem != OBJECT_INVALID)
        {
            DelayCommand(4.0, RestoreAllProperties(oItem, oExit, -1));
            oItem = GetNextItemInInventory(oExit);
        }
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_ARMS));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_ARROWS));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_BELT));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_BOLTS));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_BOOTS));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_BULLETS));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_CHEST));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_CLOAK));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_HEAD));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_LEFTHAND));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_LEFTRING));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_NECK));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_RIGHTHAND));
        DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oExit, INVENTORY_SLOT_RIGHTRING));
    }
}
