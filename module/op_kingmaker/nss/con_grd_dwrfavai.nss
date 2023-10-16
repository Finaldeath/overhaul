//::///////////////////////////////////////////////
//:: Dwarf job incomplete
//:: con_grd_dwrfavai
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The dwarf job is still available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")<20
        && GetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB")==0;
    return iResult;
}
