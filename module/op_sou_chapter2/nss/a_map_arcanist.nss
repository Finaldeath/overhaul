//::///////////////////////////////////////////////
//:: Map Note (Action - Arcanist)
//:: A_Map_Arcanist.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the Arcanists' Tower map note.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMapPin = GetNearestObjectByTag("ArcanistTower");
    SetMapPinEnabled(oMapPin, TRUE);
}
