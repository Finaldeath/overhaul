//::///////////////////////////////////////////////
//:: Not dumb and has Obould head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:       Brent
//:: Created On:       November 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    int l_iResult;

    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_OBOULD")==0
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_VAATH")==1
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_ROLKIDGUZUD")==1)
    {
        l_iResult = (CheckIntelligenceNormal()
            && HasItem(GetPCSpeaker(),"M3Q3_A02OBOUL"));
    }
    else
    {
        return FALSE;
    }
    return l_iResult;
}
