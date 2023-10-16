#include "help_conv"

void main()
{
    string sTag = GetTag(OBJECT_SELF);

    SetSelfTalkLevelInt(OBJECT_SELF, 2);

    object oPC = GetPCSpeaker();

    object oDoor = GetNearestObjectByTag("DOOR_019_0_0", oPC);

    SetLocked(oDoor, FALSE);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
