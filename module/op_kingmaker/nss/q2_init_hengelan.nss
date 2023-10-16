//::///////////////////////////////////////////////
//:: q2_init_hengelan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli initiates after Thaddeus/Gelani plot
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
        object oThad = GetObjectByTag("q2_thaddeus");
        object oGel = GetObjectByTag("q2_gelani");
        int nKill = GetLocalInt(GetModule(), "OS_KILLGELANI");
        int nHelp = GetLocalInt(GetModule(), "OS_HELPGELANI");
        if(GetIsObjectValid(oJab)
            && (nKill >=20 || nHelp==99))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oJab,50);
            DestroyObject(OBJECT_SELF);
        }
    }
}
