//::///////////////////////////////////////////////
//:: q3_init_henilli
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli initiates in the illithid caves
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
        if(GetIsObjectValid(oJab)
            && GetLocalInt(GetFirstPC(), "OS_JAB_LIKE")>=60
            && GetLocalInt(GetFirstPC(), "OS_JAB_HATE")!=10)
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oJab,70);
            DestroyObject(OBJECT_SELF);
        }
    }
}
