//::///////////////////////////////////////////////
//:: q6_Shaori30x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Set Shaori talk variable to 30 (told to go to castle)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////


void main()
{
  AddJournalQuestEntry("q6_mainquest",20,GetPCSpeaker());
  AddJournalQuestEntry("q6_shaori",99,GetPCSpeaker());
  if (GetLocalInt(OBJECT_SELF,"Shaori")<=30)
    {
    SetLocalInt(OBJECT_SELF,"Shaori",30);
    }
}
