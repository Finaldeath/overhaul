//::///////////////////////////////////////////////
//:: q2_init_henyenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates after talking to Yenna
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
        object oYen = GetObjectByTag("q2_yenna");
        if(GetLocalInt(oYen,"OS_TALKED_TO")>0)
        {
            if(GetIsObjectValid(oTrip))
            {
                os_SetTriggerEntered();
                os_SetHenchTrig(oTrip,60);
                DestroyObject(OBJECT_SELF);
            }
        }
    }
}
