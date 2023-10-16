//::///////////////////////////////////////////////
//:: q2_init_henstart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The henchmen initiate after the election starts
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()==oPC
        && !os_CheckTriggerEntered())
    {
        object oKai = GetNearestObjectByTag("os_hen_kai");
        object oCal = GetNearestObjectByTag("os_hen_cal");
        object oRom = os_CheckRomance(oKai,oCal,oPC);

        if(GetIsObjectValid(oRom))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oRom,20);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oCal))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oCal,20);
            DestroyObject(OBJECT_SELF);
        }
        else if(GetIsObjectValid(oKai))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oKai,20);
            DestroyObject(OBJECT_SELF);
        }
    }
}
