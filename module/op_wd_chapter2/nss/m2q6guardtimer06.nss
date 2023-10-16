//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GuardTimer06
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard warns the PC and then waits 6 seconds.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Timer1") == 50)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Timer1",40);
        DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(601)));
        ActionUnequipItem(GetItemPossessedBy(OBJECT_SELF,"NW_WSWSS001"));
    }
}
