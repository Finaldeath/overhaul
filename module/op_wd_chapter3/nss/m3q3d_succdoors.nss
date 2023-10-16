//::///////////////////////////////////////////////
//:: M3Q3D_SUCCDOORS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the succubus hasn't opened the doors already
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal()
        && GetLocalInt(GetPCSpeaker(),"NW_G_M3Q3D_SUCCDOORS")==0;
    return iResult;
}
