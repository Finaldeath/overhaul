//::///////////////////////////////////////////////
//:: Foresters' Vote
//:: con_mom_forestb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The foresters' guild will be voting for Sir Becket
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_FOREST_GUILD")!=10;
    return iResult;
}
