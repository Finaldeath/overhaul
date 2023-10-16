//::///////////////////////////////////////////////
//:: Disturbed
//:: 2q4d_05_altar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the proper item is placed on the altar, the
    item, altar, and door are destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oPC = GetLastDisturbed();
    object oItem = GetItemPossessedBy(OBJECT_SELF,"2Q4_IlluskWater");

    if (GetIsObjectValid(oItem))
    {
        RewardXP("m2q4_Illusk",20,oPC);
        AddJournalQuestEntry("m2q4_Illusk",40,oPC);
        DestroyObject(oItem);
        SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(400));
    }
}
