// pickup rune and create the rune in the inventory

void CreateRune(object oPC)
{
    CreateItemOnObject("q2b_rune", oPC);
}

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
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    // cycle all plate triggers and trigger the event 102 (exit) if an this item was inside the trigger
    int i;
    for(i = 1; i <= 16; i++)
    {
        string sTag = "Q2B_TRIG_PLATE" + IntToString(i);
        object oTrig = GetObjectByTag(sTag);
        if(ObjectOnTrigger(OBJECT_SELF, oTrig) == TRUE)
            SignalEvent(oTrig, EventUserDefined(102));
    }

    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.0));
    CreateRune(oPC);
    DelayCommand(0.5, DestroyObject(OBJECT_SELF));

}
