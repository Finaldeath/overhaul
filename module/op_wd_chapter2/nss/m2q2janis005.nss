//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q2Janis005
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Janis goes home.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 8, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(500));
    }
}
