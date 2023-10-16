//::///////////////////////////////////////////////
//:: PC Ignored
//:: con_lev_ignored
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Levio'sa will not talk to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_FOREST_GUILD")==99;
    return iResult;
}
