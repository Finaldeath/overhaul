//::///////////////////////////////////////////////
//:: M4Q1A04Jail_Open.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Opens the jail door.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oDoor = GetNearestObjectByTag("M4DoorGrate");
    SetLocked(oDoor, FALSE);
    if(!GetIsOpen(oDoor))
    {
        ActionOpenDoor(oDoor);
        DelayCommand(4.0,WalkWayPoints());
    }
}
