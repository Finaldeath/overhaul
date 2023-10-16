//::///////////////////////////////////////////////
//:: Check Dexterity Normal
//:: os_con_chkdexn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC has normal or better dexterity
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetAbilityScore(GetFirstPC(),ABILITY_DEXTERITY)>=10;
    return iResult;
}
