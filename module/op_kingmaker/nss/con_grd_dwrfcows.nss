//::///////////////////////////////////////////////
//:: con_grd_dwrfcows
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The cow and dwarf jobs are open
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")<20
        && GetLocalInt(GetModule(), "OS_THEGORD_COWS")<20
        && GetLocalInt(GetModule(), "OS_THEGORD_ARCH")>=30;
    return iResult;
}
