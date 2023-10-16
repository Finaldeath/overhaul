//::///////////////////////////////////////////////
//:: Wife Trigger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Wife has crossed this trigger she is happy
    and the player is now officially a Hero(TM)
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 28 2001
//:://////////////////////////////////////////////


void main()
{
    if (GetTag(GetEnteringObject()) == "BretsWife3Q21")
    {
      SetLocalInt(GetEnteringObject(),"NW_G_M3Q00TALKFOLLOWPC",2);
 //     SetLocalInt(GetModule(),"NW_G_M3Q02PLOTBRETSFAMILYSAFE",1);
      AssignCommand(GetEnteringObject(), ActionStartConversation(OBJECT_SELF));
      // * update journal
      AddJournalQuestEntry("M3Q2_A10_BRET", 25, GetLocalObject(GetModule(),"M3Q00OBRETFAMILY"));
    }
}
