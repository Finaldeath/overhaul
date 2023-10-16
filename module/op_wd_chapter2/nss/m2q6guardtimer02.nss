//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GuardTimer02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard warns the PC for the second time and
    then waits 6 seconds.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Timer1",20);
    ActionEquipItem(GetItemPossessedBy(OBJECT_SELF,"NW_WSWSS001"),INVENTORY_SLOT_RIGHTHAND);
    DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(600)));
}
