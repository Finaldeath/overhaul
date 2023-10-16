//::///////////////////////////////////////////////
//:: Check LockPicks
//:: q2c24b_stl_picks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the PC has any lockpicks
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_STIL_LOCKPICKS")==10
        && os_CheckLockPicks();
    return iResult;
}
