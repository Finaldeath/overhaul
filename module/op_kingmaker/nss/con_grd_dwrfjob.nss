//::///////////////////////////////////////////////
//:: Dwarf Job Finished
//:: con_grd_dwrfjob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the Dwarf job
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    int nDwarf = GetLocalInt(GetModule(), "OS_THEGORD_DWARF");
    iResult = nDwarf==30;
    return iResult;
}
