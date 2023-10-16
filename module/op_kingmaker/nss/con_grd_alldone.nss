//::///////////////////////////////////////////////
//:: Jobs Done
//:: con_grd_alldone
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All the Gord's jobs have been completed
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")==40
        && GetLocalInt(GetModule(), "OS_THEGORD_COWS")==40
        && GetLocalInt(GetModule(), "OS_THEGORD_ARCH")==40;
    return iResult;
}
