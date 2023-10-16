//::///////////////////////////////////////////////
//:: q2_init_henbeck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates after talking to Becket
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
        object oBeck = GetObjectByTag("q2_sirbecket");
        if(GetIsObjectValid(oTrip)
            && GetLocalInt(oBeck,"OS_TALKED_TO")>0)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,70);
            DestroyObject(OBJECT_SELF);
        }
    }
}
