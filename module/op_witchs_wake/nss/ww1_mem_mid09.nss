//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Middle 09
//:: WW1_Mem_Mid09.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the custom token for the middle of
     the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    string sNormalInt = " to our loyalty to the king";
    string sLowInt =  " of us being all loyal to the king";
    string sMessage;
    int bIntelligence = CheckIntelligenceNormal();

    if (bIntelligence == TRUE)
    {
        sMessage = sNormalInt;
    }
    else
    {
        sMessage = sLowInt;
    }

    SetCustomToken(9386, sMessage);
    SetLocalInt(OBJECT_SELF, "iMiddleComplete", 9);
}
