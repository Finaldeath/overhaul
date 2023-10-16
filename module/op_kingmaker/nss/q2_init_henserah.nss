//::///////////////////////////////////////////////
//:: q2_init_henserah
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli initiates after talking to Serah
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
        object oJab = GetNearestObjectByTag("os_hen_jab");
        object oSerah = GetObjectByTag("q2_serah");
        if(GetIsObjectValid(oJab)
            && GetLocalInt(oSerah,"OS_TALKED_TO")>0)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oJab,30);
            DestroyObject(OBJECT_SELF);
        }
    }
}
