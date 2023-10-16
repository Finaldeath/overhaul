//::///////////////////////////////////////////////
//:: q3ai_mw_anydbl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to make sure the PC is not a gnome or a halfling
    and that they can equip double ended weapons.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"

int StartingConditional()
{
    object oPC = GetFirstPC();
    int iResult = FALSE;

    if ((os_CheckMW(OS_MW_QUARTERSTAFF) == TRUE)
    || (os_CheckMW(OS_MW_DIREMACE) == TRUE)
    || (os_CheckMW(OS_MW_DOUBLEAXE) == TRUE)
    || (os_CheckMW(OS_MW_TWOBLADEDSWORD) == TRUE))
    {
        iResult = GetRacialType(oPC) != RACIAL_TYPE_GNOME
            && GetRacialType(oPC) != RACIAL_TYPE_HALFLING;
    }

    return iResult;
}
