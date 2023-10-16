//open the other entrance to the mummy cave
void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF), "nOpenDoors") != 1)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "nOpenDoors", 1);
        object oDoor = GetObjectByTag("q7_mumdoor1");
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
}
