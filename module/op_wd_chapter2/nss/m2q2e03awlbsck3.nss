//::///////////////////////////////////////////////
//:: Check Plot Status
//:: M2Q2E03AWLBSCK3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the PC has spoken with the NPC
    already about the main druid plot for chapter 2.
*/
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M2Q2E03AAWILL_B") == 10;
    return iResult;
}

