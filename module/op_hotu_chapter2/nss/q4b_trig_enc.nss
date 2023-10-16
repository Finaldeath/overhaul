// Generic encounter trigger for maker dungeon:
// The monster type is stored in the key tag.
// The trigger search for all nearest waypoints with the same tag as itself to spawn the monsters

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    string sResRef = GetLockKeyTag(OBJECT_SELF);

    int i = 1;
    object oWP = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(oWP));
        i++;
        oWP = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, i);
    }
}
