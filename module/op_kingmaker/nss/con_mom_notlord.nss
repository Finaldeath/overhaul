//::///////////////////////////////////////////////
//:: con_mom_notlord
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC was not voted lord
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oMod = GetModule();
    iResult = GetLocalInt(oMod,"OS_PC_LORD")!=50;
    return iResult;
}
