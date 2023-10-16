//::///////////////////////////////////////////////
//:: Thieves' vote
//:: con_mom_thievesb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The thieves' guild is voting for Sir Becket
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_THIEVES_GUILD")!=10;
    return iResult;
}
