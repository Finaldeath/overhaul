//::///////////////////////////////////////////////
//:: PC on job
//:: con_grd_onquest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is already on a job for the Gord
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB")==10;
    return iResult;
}
