//::///////////////////////////////////////////////
//:: con_jab_betray
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli is possessed of the urge to betray the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(), "OS_JABOLI_BETRAY")==10;
    return iResult;
}
