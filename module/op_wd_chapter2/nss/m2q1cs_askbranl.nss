//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1cs_AskBranL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Bran has been found yet.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 6, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() &&
           !GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02"));
}
