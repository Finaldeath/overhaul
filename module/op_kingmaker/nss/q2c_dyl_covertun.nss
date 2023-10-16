//::///////////////////////////////////////////////
//:: Create Rocks
//:: q2c_dyl_covertun
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The tunnel opening is covered with rocks
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q2c24c_way_rocks");
    object oGrate = GetObjectByTag("q2c24c_grate");
    object oRocks = GetObjectByTag("q2c24c_plc_rocks");
    location lWay = GetLocation(oWay);
    object oPC = GetFirstPC();
    if(!GetIsObjectValid(oRocks))
    {
        CreateObject(OBJECT_TYPE_PLACEABLE,"q2c24c_plc_rocks",lWay);
    }
    if(GetIsObjectValid(oGrate))
    {
        DestroyObject(oGrate);
    }
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,500);
    }
    object oDoor = GetObjectByTag("q2ac24_at_q2ac");
    SetLocked(oDoor,FALSE);
}
