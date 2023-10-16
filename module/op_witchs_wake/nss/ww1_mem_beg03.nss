//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Beginning 03
//:: WW1_Mem_Beg03.nss
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
    string sNormalInt = "Let this stone stand in testament";
    string sLowInt = "This rock be here because";
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
    SetLocalInt(OBJECT_SELF, "iBeginningComplete", 3);
}
