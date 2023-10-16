//::///////////////////////////////////////////////
//:: act_cal_curbflrt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast's flirting is curbed successfully
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
        SetLocalInt(oPC,"OS_CAL_ROMANCE",30);
    }
}
