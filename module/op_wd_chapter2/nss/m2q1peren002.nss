//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren waits 6 seconds for a response.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Heal",GetLocalInt(OBJECT_SELF,"NW_L_Heal") + 10);
    DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(200)));
}
