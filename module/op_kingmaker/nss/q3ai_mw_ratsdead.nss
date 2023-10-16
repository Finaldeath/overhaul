//::///////////////////////////////////////////////
//:: Dead Rats
//:: q3ai_mw_ratsdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The rats chewing on Caliban are dead
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MW_RATSDEAD")==1;
    return iResult;
}
