//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2_Caretaker01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC has 200 gold and
    normal intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 22, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetGold(GetPCSpeaker()) >= 200;
    return iResult;
}
