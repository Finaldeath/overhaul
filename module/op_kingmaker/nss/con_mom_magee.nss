//::///////////////////////////////////////////////
//:: Mages' Vote
//:: con_mom_magee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The mage guild is voting for Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MAGEGUILD_PC")!=10;
    return iResult;
}
