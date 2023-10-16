//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1ATELAITH15
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Elaith leaves the Alliance Arms Inn.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    ClearAllActions();
    SetLocalInt(OBJECT_SELF,"I_Am_Leaving",1);
    SetLocalInt(GetModule(), "Ach_Serpents_Gems", 1);
    ActionMoveToObject(oDoor,FALSE,1.9);
    ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
