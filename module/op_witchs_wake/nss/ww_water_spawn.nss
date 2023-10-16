//::///////////////////////////////////////////////
//:: Witchwork: Water Spawner
//:: WW_Water_Spawn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns in water tiles then destroys itself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 15, 2004
//:://////////////////////////////////////////////
#include "x2_inc_toollib"

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    ActionDoCommand(TLChangeAreaGroundTiles(oArea, X2_TL_GROUNDTILE_WATER, 12, 6, -2.5));

    //Destroy self now that everything's set up.
    ActionDoCommand(DestroyObject(OBJECT_SELF, 5.0));
}
