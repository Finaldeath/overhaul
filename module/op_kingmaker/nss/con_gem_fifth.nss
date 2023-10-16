//::///////////////////////////////////////////////
//:: Fifth Gem
//:: con_gem_fifth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC finds the fifth gem or greater
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_PSIONIC_GEM") >= 4;
    return iResult;
}
