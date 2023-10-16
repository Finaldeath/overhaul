//::///////////////////////////////////////////////
//:: Archaeologist Not Rescued
//:: con_grd_archbad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The archaeologist has not been rescued
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")==35;
    return iResult;
}
