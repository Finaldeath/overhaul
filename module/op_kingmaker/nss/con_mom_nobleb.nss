//::///////////////////////////////////////////////
//:: Noble Vote
//:: con_mom_nobleb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The nobles' guild is voting for Sir Becket
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_NOBLE_GUILD")!=10;
    return iResult;
}
