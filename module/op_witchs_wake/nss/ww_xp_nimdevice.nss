//::///////////////////////////////////////////////
//:: Witchwork 1: XP Reward (Nimmermaer's Device)
//:: WW_XP_NimDevice.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     To give the player an XP reward, copy and
     rename this script, then fill in the details
     below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 25, 2004
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
/////////////////////////////////////////////////
//////Fill in the following information. ////////
/////////////////////////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    int bRecorded = GetLocalInt(OBJECT_SELF, "bRecorded");
    int iLeaksRecorded = GetLocalInt(GetModule(), "iLeaksRecorded");
    if (bRecorded == FALSE)
    {
        iLeaksRecorded++;
        SetLocalInt(GetModule(), "iLeaksRecorded", iLeaksRecorded);
        SetLocalInt(OBJECT_SELF, "bRecorded", TRUE);
    }
    string sLeaksRecorded = IntToString(iLeaksRecorded);
    string sRewardTag = "XP_ST_Nimmermaer'sDevice_"+sLeaksRecorded;

//////Define the PC to be rewarded. No default.
    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = iLeaksRecorded * 25;

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
