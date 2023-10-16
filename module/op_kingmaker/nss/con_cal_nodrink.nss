//::///////////////////////////////////////////////
//:: con_cal_nodrink
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast is on the romance plot and has promised not to drink.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(OBJECT_SELF,"OS_CAL_NODRINK")==10
        && GetLocalInt(oPC,"OS_CAL_ROMANCE")<80;
    return iResult;
}
