//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5ZAMITH2002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra gives the PC 20 seconds to leave.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 12, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Moved",20);
    DelayCommand(20.0,SignalEvent(OBJECT_SELF,EventUserDefined(502)));
}
