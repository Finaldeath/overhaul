//::///////////////////////////////////////////////
//:: con_mw_noconfuse
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC hasn't yet put confusion on his weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MW_DAZE")==1
        && GetHitDice(oPC)>=6;
    return iResult;
}
