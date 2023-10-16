//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Script #10
//:: m2q3H_Guardian10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has Belial's oath
    and is of Normal Intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBelialOath = GetItemPossessedBy(oPC,"M2Q3_OATHBELIAL");

    if (GetIsObjectValid(oBelialOath))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}


