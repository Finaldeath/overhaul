//::///////////////////////////////////////////////
//:: Either plot incomplete
//:: M2Q5CSFARMPLOT05
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Either plot incomplete, Low IQ
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = (GetLocalInt(GetModule(), "NW_G_LEAH_HOME") < 20 ||
                GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") < 20) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q05ILEAHRING")) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q05ILEAHRING")) &&
                CheckIntelligenceLow();

    return l_iResult;
}
