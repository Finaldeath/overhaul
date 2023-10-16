//::///////////////////////////////////////////////
//:: Talked To
//:: q2c24b_stl_start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player has spoken to Stiletto
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckTalkedTo(0);
    return iResult;
}
