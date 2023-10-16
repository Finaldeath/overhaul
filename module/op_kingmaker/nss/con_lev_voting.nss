//::///////////////////////////////////////////////
//:: Levio'Sa voting for the player
//:: con_lev_voting
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Levio'Sa is already voting for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_FOREST_GUILD")==10;
    return iResult;
}
