//::///////////////////////////////////////////////
//:: Catapult: Maximum Range Condition Script
//:: Cat_Max_Range_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player's range is now at
    30 meters or greater.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iRange = GetLocalInt(oPC, "iRange");

    if (iRange >= 30)
    {
        return TRUE;
    }
    return FALSE;
}
