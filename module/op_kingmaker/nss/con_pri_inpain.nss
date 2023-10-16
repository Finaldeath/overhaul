//::///////////////////////////////////////////////
//:: Local Guard in Pain
//:: con_pri_inpain
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the prison guard has not been healed
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetCurrentHitPoints()!=GetMaxHitPoints();
    return iResult;
}
