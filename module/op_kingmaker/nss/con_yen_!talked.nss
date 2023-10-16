//::///////////////////////////////////////////////
//:: con_yen_!talked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC hasn't yet asked Yenna what she wants to talk about.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckTalkedTo(1);
    return iResult;
}
