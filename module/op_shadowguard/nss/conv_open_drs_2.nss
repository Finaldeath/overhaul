void main()
{
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(o), 10) == "DOOR_INT_2")
        {
            SetLocked(o, FALSE);

            AssignCommand(o, ActionOpenDoor(o));
        }

        o = GetNextObjectInArea();
    }
}
