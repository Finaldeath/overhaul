//::///////////////////////////////////////////////
//:: Create Cloak
//:: q1_cori_disturb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the cloak when the flower is placed on the headstone
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    if(GetTag(GetInventoryDisturbItem())=="q2_flower"
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        object oWay = GetObjectByTag("q1_way_cori");
        location lWay = GetLocation(oWay);
        CreateObject(OBJECT_TYPE_ITEM,"q2_coriscloak",lWay);
    }
}
