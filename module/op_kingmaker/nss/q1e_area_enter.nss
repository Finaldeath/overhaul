//::///////////////////////////////////////////////
//:: q1e_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On area enter script for Grove
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        object oMap = GetObjectByTag("q1_map_kaigrove");
        SetMapPinEnabled(oMap,1);
        object oShrub = GetObjectByTag("q1e_kai_shrub");
        //if Kaidala's tree has been planted
        if(GetIsObjectValid(oShrub))
        {
        //replace the shrub with a tree
            CreateObject(OBJECT_TYPE_PLACEABLE,"q1e_kai_tree",GetLocation(oShrub));
            DelayCommand(0.5,DestroyObject(oShrub));
            os_SetAreaEntered();
        }
    }
}
