//::///////////////////////////////////////////////
//:: Trades Vote
//:: con_mom_tradese
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Trades guild supports Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_TRADES_GUILD")!=10;
    return iResult;
}
