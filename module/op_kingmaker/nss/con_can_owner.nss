//::///////////////////////////////////////////////
//:: con_can_owner
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has not confirmed ownership status with the candelabra
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(), "q2_pcliedtobutler")==0;
    return iResult;
}
