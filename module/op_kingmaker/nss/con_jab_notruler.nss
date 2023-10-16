//::///////////////////////////////////////////////
//:: con_jab_notruler
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC lost the election
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    int nLord = GetLocalInt(GetModule(),"OS_PC_LORD");
    iResult = nLord == 60 || nLord == 70;
    return iResult;
}
