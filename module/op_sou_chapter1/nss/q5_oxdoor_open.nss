//::///////////////////////////////////////////////
//:: ox fence door on-open event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When opened causes the oxen inside to stampede into the other side of the cavern.
    The player that opened needs to take a tumble check to avoid damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 19/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_tool"

void main()
{
    object oPC = GetLastOpenedBy();
    SignalEvent(OBJECT_SELF, EventUserDefined(101));

}
