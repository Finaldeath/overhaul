//::///////////////////////////////////////////////
//:: Catapult: Minimum Range Condition Script
//:: Cat_Min_Range_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player's range is now at
    3 meters or less.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iRange = GetLocalInt(oPC, "iRange");

    if (iRange <= 3)
    {
        return TRUE;
    }
    return FALSE;
}
