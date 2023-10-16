//::///////////////////////////////////////////////
//:: act_cal_givering
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast gives the ring to the PC; they live happily ever after
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_CAL_ROMANCE",75);
    CreateItemOnObject("os_hen_calring",oPC);
}
