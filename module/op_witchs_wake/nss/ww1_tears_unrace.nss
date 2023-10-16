//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, NonRace Condition
//:: WW1_Tears_UnRace.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is not of elven or
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

    if (iRace != RACIAL_TYPE_ELF &&
        iRace != RACIAL_TYPE_HALFELF)
    {
        return TRUE;
    }
    return FALSE;
}
