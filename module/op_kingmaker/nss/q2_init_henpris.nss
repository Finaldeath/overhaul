//::///////////////////////////////////////////////
//:: q2_init_henpris
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates in the Prison
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
        object oDylan = GetObjectByTag("q2_dylan");
        if(GetIsObjectValid(oTrip)
            && GetLocalInt(oDylan,"OS_DYLAN_PRISON")>=2)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,20);
            DestroyObject(OBJECT_SELF);
        }
    }
}
