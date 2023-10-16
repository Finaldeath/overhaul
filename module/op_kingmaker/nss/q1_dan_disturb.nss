//::///////////////////////////////////////////////
//:: Create Helm
//:: q1_dan_disturb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the helm when the berries are placed on the headstone
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    if(GetTag(GetInventoryDisturbItem())=="q1_danberry"
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        object oWay = GetObjectByTag("q1_way_dan");
        location lWay = GetLocation(oWay);
        CreateObject(OBJECT_TYPE_ITEM,"q1_dan_helm",lWay);
    }
}
