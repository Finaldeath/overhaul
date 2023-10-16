//::///////////////////////////////////////////////
//:: act_cal_attentio
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast pacifies the PC's need for more attention
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_CAL_ROMANCE")!=80)
    {
        SetLocalInt(oPC,"OS_CAL_ROMANCE",40);
    }
}
