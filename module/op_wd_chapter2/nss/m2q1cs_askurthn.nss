//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1cs_AskUrthN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Urth has been found yet.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 6, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           !GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING01"));
}
