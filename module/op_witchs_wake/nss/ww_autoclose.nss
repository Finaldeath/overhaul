//::///////////////////////////////////////////////
//:: Witchwork: Auto-Close
//:: WW_AutoClose.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Automatically closes the door or placeable
     30 seconds after it's been opened.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(30.0, ActionCloseDoor(OBJECT_SELF));
}
