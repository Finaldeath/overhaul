//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && DoesPlayerHaveEckelNote(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2C_GALIANOTE")==0;
    return iResult;
}

