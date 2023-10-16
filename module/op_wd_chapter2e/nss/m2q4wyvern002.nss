//::///////////////////////////////////////////////
//:: Conversation
//:: m2q4Wyvern002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wyvern gives his ear.
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan 23, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q02IWYVERNEAR"),GetPCSpeaker());
    ActionResumeConversation();
}

