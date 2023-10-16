//::///////////////////////////////////////////////
//:: Map Note (Action - Crypt)
//:: A_Map_Crypt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the Crypt Tower map note.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMapPin = GetNearestObjectByTag("CryptTower");
    SetMapPinEnabled(oMapPin, TRUE);
}
