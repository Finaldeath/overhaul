//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Middle 06
//:: WW1_Mem_Mid06.nss
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
    string sNormalInt = " Prince Ahmed is dead.";
    string sLowInt = " Prince Ahmed, he all dead.";
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
    SetLocalInt(OBJECT_SELF, "iMiddleComplete", 6);
}
