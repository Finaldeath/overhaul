//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer (Activate Well)
//:: WW1_Nim_Well.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the well as being descendable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    SetLocalInt(GetModule(), "bWellActive", TRUE);
    SendMessageToAllDMs("The Old Man's Well is now ACTIVE, allowing players "+
                        "to enter Brogan's Tears.");


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_ST_WellToCavanaugh";

//////Define the PC to be rewarded. No default.
    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = 50;

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
