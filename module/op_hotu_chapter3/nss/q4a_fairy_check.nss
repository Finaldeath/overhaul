//::///////////////////////////////////////////////
//:: Name q4a_fairy_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks to see if the PC is poly-
    morphed into a pixie.  If so, give them the
    option to fly through the hole.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
int StartingConditional()
{
    int iResult;

    if(CheckPixie(GetPCSpeaker()))
       return TRUE;
    else
       return FALSE;

}
