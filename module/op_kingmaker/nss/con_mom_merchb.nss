//::///////////////////////////////////////////////
//:: Merchants' Vote
//:: con_mom_merchb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The merchant guild is voting for Sir Becket
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MERCHGUILD_PC")!=10;
    return iResult;
}
