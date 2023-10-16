//::///////////////////////////////////////////////
//:: Witchwork: XP Reward (Johann, Tell Truth)
//:: WW_XP_JohannTruth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     To give the player an XP reward, copy and
     rename this script, then fill in the details
     below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 5, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalString(oPC, "sJohannRests", "Yes");

/////////////////////////////////////////////////
//////Fill in the following information. ////////
/////////////////////////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_RO_BernhardtsFate";

//////Define the PC to be rewarded. No default.
//    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = 30;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
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
