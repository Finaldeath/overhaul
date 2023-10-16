//::///////////////////////////////////////////////
//:: Dead Wind (OnDeath)
//:: Dt_DeadWind.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Create the casket that contains the Dead
     Wind item.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////

void main()
{
    //Create sparkly to mark the item drop.
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicwhite", lLoc, FALSE, "DeadWind_Sparkly");
}
