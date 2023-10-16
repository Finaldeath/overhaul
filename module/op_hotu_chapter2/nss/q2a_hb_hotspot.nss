//::///////////////////////////////////////////////
//:: Name q2a_hb_hotspot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If there are still drow in the hotspot,
    do a check for Drow Victory
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 20/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    //DEBUG
    //SendMessageToPC(GetFirstPC(), "Number Drow: " + IntToString(GetLocalInt(OBJECT_SELF, "nDrowEntered")));
    //if the Battle hasn't begun or is over - do nothing
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Started") != 1)
        return;
    if (GetLocalInt(OBJECT_SELF, "nDrowEntered") < 1)
        return;

    object oArea = GetArea(OBJECT_SELF);
    SignalEvent(oArea, EventUserDefined(HOTSPOT_CHECK));

}
