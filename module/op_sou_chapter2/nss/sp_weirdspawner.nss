//::///////////////////////////////////////////////
//:: Weird Spawner (OnSpawn)
//:: Sp_WeirdSpawner.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger the UD event on the Weird.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void main()
{
    object oTentacleDemon = GetNearestObjectByTag("TentacleDemon");

    while (oTentacleDemon == OBJECT_INVALID)
    {
        oTentacleDemon = GetNearestObjectByTag("TentacleDemon");
    }
    SignalEvent(oTentacleDemon, EventUserDefined(5009));
    DestroyObject(OBJECT_SELF);
}
