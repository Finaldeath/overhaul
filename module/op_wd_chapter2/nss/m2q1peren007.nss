//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren007
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren give the PC his armor and his journal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    GiveGoldToCreature(GetPCSpeaker(),GetGold());
    ActionGiveItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND),GetPCSpeaker());
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
}
