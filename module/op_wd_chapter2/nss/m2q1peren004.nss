//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren004
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren give the PC all of his gold and his journal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    GiveGoldToCreature(GetPCSpeaker(),GetGold());
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITJOURNPEREN"),GetPCSpeaker());
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
}
