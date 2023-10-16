//::///////////////////////////////////////////////
//:: m3q1a_finalword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the pc has the last word of power
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

#include "m3plotinclude"
void main()
{
    object oPC = GetEnteringObject();
    object oAarin = GetNearestObjectByTag("AARINGEND3Q11");
    if(GetIsPC(oPC)
        && GetLocalInt(oAarin,"L_TALKTIMES") == 3
        && (HaveAnyWord(oPC) == TRUE))
    {
        DoSinglePlayerAutoSave();
        ActionSpeakStringByStrRef(67703);
    }
}
