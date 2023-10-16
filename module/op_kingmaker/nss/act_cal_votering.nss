//::///////////////////////////////////////////////
//:: act_cal_votering
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast gives the ring to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    CreateItemOnObject("os_hen_calring",oPC);
    SetLocalInt(OBJECT_SELF,"OS_CAL_FRIEND",10);
}
