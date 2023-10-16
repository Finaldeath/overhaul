//::///////////////////////////////////////////////
//:: x0_con_atwork
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if this area has this NPC
    marked as an employee
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_func"

int StartingConditional()
{
    int iResult;

    iResult = IsAtWork(OBJECT_SELF) == TRUE;
    return iResult;
}
