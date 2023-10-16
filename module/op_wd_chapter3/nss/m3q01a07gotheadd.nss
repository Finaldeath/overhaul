//::///////////////////////////////////////////////
//:: Dumb and has Vaath head
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
    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_VAATH")==0)
    {
        l_iResult = (CheckIntelligenceLow()
            && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3_A02VAATH")));
    }
    else
    {
        l_iResult = FALSE;
    }
    return l_iResult;
}


