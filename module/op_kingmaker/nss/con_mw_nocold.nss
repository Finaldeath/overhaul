//::///////////////////////////////////////////////
//:: con_mw_nocold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC hasn't yet put cold damage on his weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MW_COLD")==0
        && GetHitDice(oPC)>=4;
    return iResult;
}
