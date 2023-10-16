//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Torture20
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the ogre torturer local to 20.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 13, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Torture",20);
    DelayCommand(3.0,SignalEvent(OBJECT_SELF,EventUserDefined(600)));
}
