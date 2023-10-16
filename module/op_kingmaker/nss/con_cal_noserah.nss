//::///////////////////////////////////////////////
//:: con_cal_noserah
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Serah didn't vote for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_LANDGUILD_PC")!=10;
    return iResult;
}
