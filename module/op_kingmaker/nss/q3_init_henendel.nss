//::///////////////////////////////////////////////
//:: q3_init_henendel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast initiates in the illithid caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        object oCal = GetNearestObjectByTag("os_hen_cal");
        if(GetIsObjectValid(oCal))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oCal,70);
            DestroyObject(OBJECT_SELF);
        }
    }
}
