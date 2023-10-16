//::///////////////////////////////////////////////
//:: Constitution Check Normal
//:: os_con_chkconn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the PC's constitution at normal
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetAbilityScore(GetFirstPC(),ABILITY_CONSTITUTION)>=10;
    return iResult;
}
