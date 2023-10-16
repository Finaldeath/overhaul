//::///////////////////////////////////////////////
//:: q3_init_henmant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates in the manticore caves
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
        object oTrip = GetNearestObjectByTag("os_hen_trp");
        if(GetIsObjectValid(oTrip))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,50);
            DestroyObject(OBJECT_SELF);
        }
    }
}
