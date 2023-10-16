//::///////////////////////////////////////////////
//:: act_cal_curbdrnk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast's drinking is curbed successfully
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_CAL_NODRINK",10);
    if(GetLocalInt(oPC,"OS_CAL_ROMANCE")!=80)
    {
        SetLocalInt(oPC,"OS_CAL_ROMANCE",20);
    }
}
