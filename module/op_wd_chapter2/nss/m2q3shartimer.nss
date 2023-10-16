//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3SharTimer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shara gives the PC some time to explain themselves.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 23, 2001
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
    SetLocalInt(OBJECT_SELF,"NW_L_Warning",GetLocalInt(OBJECT_SELF,"NW_L_Warning") + 1);
}
