//::///////////////////////////////////////////////
//:: Conversation
//:: m2q4Delilah001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Delilah leaves.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q2AC_M2Q2AB");

    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    ActionMoveToObject(oDoor);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
