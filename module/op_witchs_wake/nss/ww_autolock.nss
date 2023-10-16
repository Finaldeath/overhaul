//::///////////////////////////////////////////////
//:: Witchwork: Auto-Lock
//:: WW_AutoLock.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Automatically closes & locks the door or
     placeable 6 seconds after it's been opened.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 25, 2002
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(12.0, ActionCloseDoor(OBJECT_SELF));
    DelayCommand(12.0, SetLocked(OBJECT_SELF, TRUE));
}
