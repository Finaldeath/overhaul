//::///////////////////////////////////////////////
//:: q2_init_hentank
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates outside the Tarnished Tankard
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
        object oThad = GetObjectByTag("q2_thaddeus");
        if(GetIsObjectValid(oTrip)
            && GetLocalInt(oThad,"OS_TALKED_TO")==10)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,40);
            DestroyObject(OBJECT_SELF);
        }
    }
}
