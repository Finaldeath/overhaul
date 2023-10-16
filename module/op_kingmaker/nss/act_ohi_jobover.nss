//::///////////////////////////////////////////////
//:: Archeologist Over
//:: act_ohi_jobover
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has brought the archeologist to the end of the caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    //give xp 500, set archeologist to finished dialogue.
    object oPC = GetFirstPC();
    object oGord = GetObjectByTag("q2_thegord");
    SetLocalInt(oPC,"OS_ARCH_KNOW",10);
    SetLocalObject(OBJECT_SELF, "OS_FOLLOW",OBJECT_INVALID);
    SetLocalInt(OBJECT_SELF,"OS_OHIO_FOLLOW",0);
    SetLocalInt(GetModule(), "OS_THEGORD_ARCH",30);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,500);
    }

}
