// One golem seal in each pedestal would open the door

void OpenDoor()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oDoor = GetObjectByTag("q4d_door2");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

}

void main()
{
    object oItem = GetInventoryDisturbItem();
    int nType = GetInventoryDisturbType();

    if(nType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        if(GetTag(oItem) == "q4d_golem_seal")
        {
            SetLocalInt(OBJECT_SELF, "HAS_SEAL", 1);
            object oOther = GetNearestObjectByTag("q4d_pedestal");
            if(GetLocalInt(oOther, "HAS_SEAL") == 1)
                OpenDoor();
        }
    }
    else if(nType == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        if(GetTag(oItem) == "q4d_golem_seal")
        {
            SetLocalInt(OBJECT_SELF, "HAS_SEAL", 0);
        }
    }

}
