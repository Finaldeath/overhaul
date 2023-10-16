//::///////////////////////////////////////////////
//:: m1q4F Area Property: On Enter
//:: m1q4F_Area_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script updates the player's journal as
    well as the world history when someone enters
    the Seedy Tavern (m1q4F)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 14, 2001
//:://////////////////////////////////////////////
#include "NW_I0_Plot"
void main()
{
    object oPC = GetEnteringObject();
    int iDocksState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q4_Docks");
    int iNewsState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q4_News");

    if (iDocksState < 40)
    {
        AddJournalQuestEntry("m1q4_Docks", 40, oPC);
    }
    /*
    if (iNewsState < 20)
    {
        AddJournalQuestEntry("m1q4_News", 20, oPC, TRUE, TRUE);
    }
    */
    if(GetIsPC(oPC) &&
       GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
       SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
       RewardXP("m1q4_Docks",50,GetPCSpeaker());
    }
}
