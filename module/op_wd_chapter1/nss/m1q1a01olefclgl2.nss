//::///////////////////////////////////////////////
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a Low int
    Check if player DOES NOT have letter from Olef
*/
//:://////////////////////////////////////////////

#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Letter")) &&
                     CheckIntelligenceLow();
    return bCondition;
}


