//::///////////////////////////////////////////////
//:: PC Can Bribe
//:: con_raf_bribable
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC doesn't have enough gold to bribe the priest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nGold = GetGold(oPC);

    iResult = nGold<2000;

    return iResult;
}
