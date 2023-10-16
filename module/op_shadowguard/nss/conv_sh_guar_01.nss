#include "help_hench"

void main()
{
    AddJournalSingle("JT_MAIN", 4, GetPCSpeaker());

    object oDoor = GetNearestObjectByTag("PT_ACAD_DOCK_DOOR", OBJECT_SELF, 1);

    SetLocked(oDoor, FALSE);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    oDoor = GetNearestObjectByTag("PT_ACAD_DOCK_DOOR", OBJECT_SELF, 2);

    SetLocked(oDoor, FALSE);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));

}
