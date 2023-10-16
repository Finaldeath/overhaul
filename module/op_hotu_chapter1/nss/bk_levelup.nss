//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  A one-time conversation file
  Plays if the character came in at a lower level.
  They have the choice to either 'instant advance'
  or manually go through the levelup process
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetLastUsedBy(), "bk_levelup", TRUE, FALSE);
}
