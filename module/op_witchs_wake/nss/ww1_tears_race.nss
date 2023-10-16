//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, Race Condition
//:: WW1_Tears_Race.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is of elven or
     half-elven descent.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iRace = GetRacialType(oPC);

    if (iRace == RACIAL_TYPE_ELF ||
        iRace == RACIAL_TYPE_HALFELF)
    {
        return TRUE;
    }
    return FALSE;
}
