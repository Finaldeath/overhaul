//::///////////////////////////////////////////////
//:: Feran Not Dead
//:: con_lam_feran
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Feran not dead
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_FERAN_DEAD")!=10
        && GetLocalInt(GetFirstPC(), "OS_FERAN_GONE")!=10;
    return iResult;
}
