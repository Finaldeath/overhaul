//::///////////////////////////////////////////////
//:: Check Plot Status && Check Intelligence Normal
//:: M2Q2E03AWLASCK2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the PC has normal / low int.
    and if the PC has spoken with the NPC already
    about the main druid plot for chapter 2.
*/
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && GetLocalInt(GetPCSpeaker(), "NW_L_M2Q2E03AAWILL_B") == 10;
    return iResult;
}
