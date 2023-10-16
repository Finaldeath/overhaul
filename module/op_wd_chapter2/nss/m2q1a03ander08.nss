#include "NW_I0_PLOT"
void main()
{
    RewardGP(68,GetPCSpeaker(),FALSE);
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    SetLocalInt(OBJECT_SELF,"I_Am_Leaving",1);
    ActionMoveToObject(oDoor);
    ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    SetCommandable(FALSE);
}
