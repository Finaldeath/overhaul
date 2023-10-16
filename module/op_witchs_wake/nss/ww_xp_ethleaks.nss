//::///////////////////////////////////////////////
//:: Witchwork 1: XP Reward (Ethereal Leaks)
//:: WW_XP_EthLeaks.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     To give the player an XP reward, copy and
     rename this script, then fill in the details
     below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
/////////////////////////////////////////////////
//////Fill in the following information. ////////
/////////////////////////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    int bActivated = GetLocalInt(OBJECT_SELF, "bActivated");
    int iLeaksActivated = GetLocalInt(GetModule(), "iLeaksActivated");
    if (bActivated == FALSE)
    {
        iLeaksActivated++;
        SetLocalInt(GetModule(), "iLeaksActivated", iLeaksActivated);
        SetLocalInt(OBJECT_SELF, "bActivated", TRUE);
    }
    string sLeaksActivated = IntToString(iLeaksActivated);
    string sRewardTag = "XP_ST_EtherealLeak_"+sLeaksActivated;

//////Define the PC to be rewarded. No default.
    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = iLeaksActivated * 25;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
    //string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
    //string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

//////Share XP & journal entry with every PC in the area? Default = FALSE
    int bShare = TRUE;

//////Set this to TRUE if you want to add a journal entry. Default = FALSE
    int bAddJournal = FALSE;

//////If adding a journal entry, fill in the appropriate info below.
//////Defaults = sRewardTag, 10
    string sJournalTag = sRewardTag;
    int iJournalState = 10;

//////Call the included function
    WW_RewardXP(sRewardTag, oPC, iXPReward, sExperienceType, bShare,
                bAddJournal, sJournalTag, iJournalState);
}
