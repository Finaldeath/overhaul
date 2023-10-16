//::///////////////////////////////////////////////
//:: Witchwork 1: Exhibit Lock
//:: WW1_ExhibitLock.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Automatically closes & locks the downstairs
     exhibit door 6 seconds after this one's
     been opened. This is to work around an engine
     bug that prevents the target door's OnOpen
     event from firing when the source door is
     opened.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTargetDoor = GetTransitionTarget(OBJECT_SELF);

    DelayCommand(6.0, ActionCloseDoor(oTargetDoor));
    DelayCommand(6.0, SetLocked(oTargetDoor, TRUE));
}
