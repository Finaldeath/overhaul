//::///////////////////////////////////////////////
//:: con_mw_noacid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC hasn't yet put acid damage on his weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MW_ACID")==0
        && GetHitDice(oPC)>=6;
    return iResult;
}
