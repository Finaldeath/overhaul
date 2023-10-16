//::///////////////////////////////////////////////
//:: Check Charisma High and Int Normal and State of Tooth
//:: m2q1alhlrdealn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a high charisma and
    normal intelligence and Alhelor has his Tooth
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: May 21, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{

    int bCondition = GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") == 50 &&
    (CheckIntelligenceNormal());
    (CheckCharismaHigh());

    return bCondition;
}

