//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6AngeloLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lieutenant Angelo leaves the tavern.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 7, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q6FtoM2Q6A");
    ActionMoveToObject(oDoor);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
