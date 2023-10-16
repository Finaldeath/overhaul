//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2wyvern002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wyvern gives the PC her ear.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q02IWYVERNEAR"),GetPCSpeaker());
    ActionResumeConversation();
}
