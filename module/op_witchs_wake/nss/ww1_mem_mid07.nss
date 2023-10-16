//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Middle 07
//:: WW1_Mem_Mid07.nss
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
    string sNormalInt = " to the valor of the fallen";
    string sLowInt = " of all the brave dead guys";
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
    SetLocalInt(OBJECT_SELF, "iMiddleComplete", 7);
}
