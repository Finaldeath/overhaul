//::///////////////////////////////////////////////
//:: Conversation
//:: m2q5Zor001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zor leaves.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q5ZORDOOR");

    //ActionMoveToObject(oDoor);
    //ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
    //ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
