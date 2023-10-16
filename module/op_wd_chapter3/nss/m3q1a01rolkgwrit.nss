//::///////////////////////////////////////////////
//:: Give Writ To Player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 16 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

/*int QuestNotGivenNorDone()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYM3Q1_A07_BANDIT_PLOT") > 10)
      return FALSE;
    return TRUE;
}*/
void main()
{
     if (HasItem(GetPCSpeaker(),"M3Q1A07WRIT") == FALSE)
     {
        CreateItemOnObject("M3Q1A07WRIT", GetPCSpeaker());
     }
//    if (QuestNotGivenNorDone() == TRUE)
//    {
        AddJournalQuestEntry("M3Q1_A07_BANDIT_PLOT",10,GetPCSpeaker());
//    }
}
