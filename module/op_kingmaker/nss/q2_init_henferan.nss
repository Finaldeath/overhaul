//::///////////////////////////////////////////////
//:: q2_init_henferan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli initiates after Feran plot
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
        object oFeran = GetObjectByTag("q2_feran");
        int nFeran = GetLocalInt(oFeran,"OS_FERANDRINKING");
        int nMilitia = GetLocalInt(oPC,"OS_MILITARYGUILD");
        if(GetIsObjectValid(oJab)
            && (nFeran == 30 || nMilitia == 10))
        {
            os_SetTriggerEntered();
            os_SetHenchTrig(oJab,60);
            DestroyObject(OBJECT_SELF);
        }
    }
}
