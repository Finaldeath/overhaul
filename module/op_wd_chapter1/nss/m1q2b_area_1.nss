//::///////////////////////////////////////////////
//:: m1q2B Area Script: OnEnter
//:: m1q2B_Area_1
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates the shared News journal category when
    a player enters the Prison
    Grants 25% of the XP alloted for the quest
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_Plot"
#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();
    int iNewsState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_News");

    if (GetIsPC(oPC))
    {
        if(GetLocalInt(GetModule(),"NW_G_M1Q2BPlayerEntered") == FALSE)
        {
            SetLocalInt(GetModule(),"NW_G_M1Q2BPlayerEntered",TRUE);
        }
        //AddJournalQuestEntry("m1q2_News", 20, oPC, TRUE, TRUE);
        if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
            RewardXP("m1q2_PrisonBreak",25,GetPCSpeaker());
        }
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_PrisonKey")>0 &&
            GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_PrisonKey")<30)
        {
            AddJournalQuestEntry("m1q2_PrisonKey", 40, oPC);
        }
    }
    AutoSave(oPC);



}
