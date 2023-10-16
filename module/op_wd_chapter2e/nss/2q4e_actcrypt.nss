//::///////////////////////////////////////////////
//:: Activate Baram Inner Dungeon
//:: 2Q4E_ActCrypt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Turns on the dungeon.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 12, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    int nSelf = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nSelf == 0)
    {
        object oBone = GetWaypointByTag("2Q4E_BoneAltarSpawn");
        object oShrine = GetWaypointByTag("2Q4E_Crypt02");
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4E_BARAM_INNER_PLOT", 1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "2Q4E_BONEALTER", GetLocation(oBone));
        CreateObject(OBJECT_TYPE_PLACEABLE, "2Q4_GRVLIGHT01", GetLocation(oShrine));
        DestroyObject(OBJECT_SELF, 0.1);
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
}
