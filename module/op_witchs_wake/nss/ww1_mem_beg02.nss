//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Beginning 02
//:: WW1_Mem_Beg02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the custom token for the beginning of
     the memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    string sNormalInt = "To whoever reads this,";
    string sLowInt = "If you reads this,";
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

    SetCustomToken(9385, sMessage);
    SetLocalInt(OBJECT_SELF, "iBeginningComplete", 2);
}
