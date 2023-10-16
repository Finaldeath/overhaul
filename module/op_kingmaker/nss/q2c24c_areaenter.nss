//::///////////////////////////////////////////////
//:: q2c24c_areaenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Autosaves on entering prison dungeon
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        DoSinglePlayerAutoSave();
        os_SetAreaEntered();
    }
}
