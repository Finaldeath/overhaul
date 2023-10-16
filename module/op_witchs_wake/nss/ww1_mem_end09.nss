//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, End 09
//:: WW1_Mem_End09.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the custom token for the end of the
     memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    string sNormalInt = " I shall miss them dearly.";
    string sLowInt = " Me miss them lots and lots.";
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

    SetCustomToken(9387, sMessage);
    SetLocalInt(OBJECT_SELF, "iEndComplete", 9);
}
