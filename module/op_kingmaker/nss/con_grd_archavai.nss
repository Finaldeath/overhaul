//::///////////////////////////////////////////////
//:: Archeologist Job Available
//:: con_grd_archavai
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The archaeologist job is still available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")<20
        && GetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB")==0;
    return iResult;
}
