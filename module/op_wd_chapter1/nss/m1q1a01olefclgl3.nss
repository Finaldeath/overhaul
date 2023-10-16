//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a normal int
    Check if player DOES have letter from Olef
*/
//:://////////////////////////////////////////////

#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Letter")) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
