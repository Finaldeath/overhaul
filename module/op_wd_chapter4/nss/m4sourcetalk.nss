//::///////////////////////////////////////////////
//:: M4SourceTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Clicking on this starts conversation.
  Depending if all the Words of Power are available
  you can enter the Sourcestone.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetClickingObject(), "M4SourceTalk");
}
