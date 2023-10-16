//::///////////////////////////////////////////////
//:: Fourth Gem
//:: con_gem_fourth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC finds the fourth gem
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_PSIONIC_GEM")==3;
    return iResult;
}
