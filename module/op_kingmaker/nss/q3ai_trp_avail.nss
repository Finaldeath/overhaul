//::///////////////////////////////////////////////
//:: Trip Still Available
//:: q3ai_trp_avail
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip is still available to be chosen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"Q3AI_TRP_CHOSEN")< 99;
    return iResult;
}
