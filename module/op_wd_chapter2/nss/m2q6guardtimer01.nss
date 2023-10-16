//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GuardTimer01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard warns the PC for the first time and
    then waits 6 seconds.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

void main()
{
     SetLocalInt(OBJECT_SELF,"NW_L_Timer1",10);
     DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(600)));
}
