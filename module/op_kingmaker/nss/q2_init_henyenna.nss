//::///////////////////////////////////////////////
//:: q2_init_henyenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli initiates after talking to Yenna
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
        object oYen = GetObjectByTag("q2_yenna");
        if(GetLocalInt(oYen,"OS_TALKED_TO")>0)
        {
            if(GetIsObjectValid(oJab))
            {
                os_SetTriggerEntered();
                os_SetHenchTrig(oJab,40);
                DestroyObject(OBJECT_SELF);
            }
        }
    }
}
