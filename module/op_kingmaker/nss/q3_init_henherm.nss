//::///////////////////////////////////////////////
//:: q3_init_henherm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip initiates in the hermit's house
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
        object oJab = GetNearestObjectByTag("os_hen_jab");
        object oKai = GetNearestObjectByTag("os_hen_kai");
        object oCal = GetNearestObjectByTag("os_hen_cal");
        object oRom = os_CheckRomance(oKai,oCal,oPC);

        if(GetIsObjectValid(oRom))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oRom,10);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oJab))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oJab,10);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oTrip))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oTrip,10);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oKai))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oKai,10);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oCal))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oCal,10);
            DestroyObject(OBJECT_SELF);
        }
    }
}
