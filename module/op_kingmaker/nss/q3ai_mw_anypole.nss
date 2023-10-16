//::///////////////////////////////////////////////
//:: q3ai_mw_anypole
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to make sure the PC is not a gnome or a halfling
    and that they can equip polearms.
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

    if ((os_CheckMW(OS_MW_SCYTHE) == TRUE)
    || (os_CheckMW(OS_MW_HALBERD) == TRUE)
    || (os_CheckMW(OS_MW_SPEAR) == TRUE))
    {
        iResult = GetRacialType(oPC) != RACIAL_TYPE_GNOME
            && GetRacialType(oPC) != RACIAL_TYPE_HALFLING;
    }

    return iResult;
}
