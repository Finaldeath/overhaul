//::///////////////////////////////////////////////
//:: Map Note (Action - Library)
//:: A_Map_Library.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the Great Library map note.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMapPin = GetNearestObjectByTag("TheGreatLibrary");
    SetMapPinEnabled(oMapPin, TRUE);
}
