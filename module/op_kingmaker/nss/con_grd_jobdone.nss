//::///////////////////////////////////////////////
//:: PC finished Job
//:: con_grd_jobdone
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished a job for the Gord
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    int nDwarf = GetLocalInt(GetModule(), "OS_THEGORD_DWARF");
    int nCow = GetLocalInt(GetModule(), "OS_THEGORD_COWS");
    int nArch = GetLocalInt(GetModule(), "OS_THEGORD_ARCH");
    iResult = (nDwarf==30)
        || (nCow>=30 && nCow<40)
        || (nArch>=30 && nArch<40);
    return iResult;
}
