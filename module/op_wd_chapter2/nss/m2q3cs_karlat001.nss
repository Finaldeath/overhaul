//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q3cs_Karlat001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Only shows up if the PC has talked to Quint.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_TalkQuint") == 1;
    return iResult;
}
