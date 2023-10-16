// module event: item dropped

int ObjectOnTrigger(object oObject, object oTrigger)
{
    object oTemp = GetFirstInPersistentObject(oTrigger, OBJECT_TYPE_PLACEABLE);
    while(oTemp != OBJECT_INVALID)
    {
        if(oObject == oTemp)
            return TRUE;
        oTemp = GetNextInPersistentObject(oTrigger, OBJECT_TYPE_PLACEABLE);
    }
    return FALSE;
}

void main()
{
    object oItem = GetModuleItemLost();
    object oPC = GetModuleItemLostBy();
    object oContainerItem;
    object oNewContainer;
    object oNewItem;
    string sBP;
    // first - check all items as it can be a plot item in a containr.
    if(GetTag(oItem) == "x1towercrystal")
    {
         FloatingTextStrRefOnCreature(40578, oPC, FALSE);
         CopyItem(oItem, oPC);
         //Destroy original
         DestroyObject(oItem, 1.0);
    }
    else
    {
        oContainerItem = GetFirstItemInInventory(oItem);
        while(oContainerItem != OBJECT_INVALID)
        {
            if(GetTag(oContainerItem) == "x1towercrystal")
            {
                 FloatingTextStrRefOnCreature(40578, oPC, FALSE);
                 CopyItem(oContainerItem, oPC);
                 DestroyObject(oContainerItem, 1.0);
            }
            oContainerItem = GetNextItemInInventory(oItem);
        }
     }

    if(GetTag(oItem) == "Q2B_RUNE")
    {
        if(GetItemPossessor(oItem) != OBJECT_INVALID)// if given to someone else or placed in an object then no need to create a placeable
            return;
        object oRune = CreateObject(OBJECT_TYPE_PLACEABLE, "q2b_rune_place", GetLocation(oItem));
        // cycle all plate triggers and trigger the event 101 (enter) if an this item is inside the trigger
        int i;
        string sTag;
        for(i = 1; i <= 16; i++)
        {
            sTag = "Q2B_TRIG_PLATE" + IntToString(i);
            object oTrig = GetObjectByTag(sTag);
            if(ObjectOnTrigger(oRune, oTrig) == TRUE)
            {
                SetLocalObject(oTrig, "ENTERING_OBJECT", oRune);
                SignalEvent(oTrig, EventUserDefined(101));
            }
        }
        DestroyObject(oItem);
    }

}
