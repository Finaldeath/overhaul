//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Mung001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mung leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1M_M2Q1A");

    ActionMoveToObject(oDoor);
    ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
