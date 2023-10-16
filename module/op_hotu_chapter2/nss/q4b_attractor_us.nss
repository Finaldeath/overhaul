// Destroy placeable and create item in inventory



void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_TAKE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_TAKE_ONCE", 1);

    object oPC = GetLastUsedBy();
    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0));
    CreateItemOnObject("golemattractor", oPC);
    DestroyObject(OBJECT_SELF, 2.0);
}
