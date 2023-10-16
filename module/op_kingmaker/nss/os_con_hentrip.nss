//::///////////////////////////////////////////////
//:: Trip Henchman
//:: os_con_hentrip
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if Trip is a henchman
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include_hench"
int StartingConditional()
{
    int iResult;

    iResult = os_Hench_Trip();
    return iResult;
}
