//::///////////////////////////////////////////////
//:: Military Vote
//:: con_mom_militiae
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Military Guild supports Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MILITARYGUILD")!=10;
    return iResult;
}
