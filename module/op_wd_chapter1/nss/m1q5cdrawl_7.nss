#include "NW_I0_Generic"
void main()
{
    object oDoor = GetNearestObjectByTag("M1Q5C04BlockedDoor");
    SetLocalInt(OBJECT_SELF,"NW_L_DyingGasp",TRUE);
    SpeakOneLinerConversation();
    DestroyObject(GetNearestObjectByTag("M1Q5C4Portal"));
    DestroyObject(GetNearestObjectByTag("M1Q5C4Info"));
    SetLocked(oDoor,FALSE);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
}
