//::///////////////////////////////////////////////
//:: q3_init_hengob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates in the goblin caves
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
        if(GetIsObjectValid(oTrip)
            && GetLocalInt(oPC,"os_serahcaves")==30)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,30);
            DestroyObject(OBJECT_SELF);
        }
    }
}
