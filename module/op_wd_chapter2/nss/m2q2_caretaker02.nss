//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2_Caretaker02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC has 200 gold and
    low intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 22, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetGold(GetPCSpeaker()) >= 200;
    return iResult;
}
