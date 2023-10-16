//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Holidays High Int Check (Condition Script)
//:: H2c_Gruul_Hi_Int.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player's Intelligence is
     greater than a DC value saved out on the NPC
     via the toolset.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iIntCheck = GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    int iDC = GetLocalInt(OBJECT_SELF, "iHolidayDC");

    if (iIntCheck >= iDC)
    {
        return TRUE;
    }
    return FALSE;
}

