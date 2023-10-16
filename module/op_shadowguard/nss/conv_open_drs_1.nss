#include "help_general"

void main()
{
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(o), 10) == "DOOR_INT_1")
        {
            RemoveAllEffects(o);

            SetLocked(o, FALSE);

            AssignCommand(o, ActionOpenDoor(o));
        }

        o = GetNextObjectInArea();
    }
}
