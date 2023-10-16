//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1ATDelilah1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Delilah gives the PC her ear.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q04IDELILAHEAR"),GetPCSpeaker());
    ActionResumeConversation();
}
