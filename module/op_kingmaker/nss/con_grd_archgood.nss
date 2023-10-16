//::///////////////////////////////////////////////
//:: Archaeologist Rescued
//:: con_grd_archgood
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The archaeologist has been rescued
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")==30;
    return iResult;
}
