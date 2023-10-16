//::///////////////////////////////////////////////
//:: q1d_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On area enter script for Graveyard
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        object oMap = GetObjectByTag("q1_map_graveyard");
        SetMapPinEnabled(oMap,1);
        os_SetAreaEntered();
    }
}
