//::///////////////////////////////////////////////
//:: Player Not Talked To
//:: os_con_!talked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player hasn't spoken to this character yet
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
