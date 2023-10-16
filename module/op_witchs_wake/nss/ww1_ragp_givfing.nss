//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Give Finger
//:: WW1_Ragp_GivFing.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player their severed finger. If
     they've already received their finger and are
     repeating the conversation, don't give them
     a second one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oPC = GetPCSpeaker();
    //int bGivenFinger = GetLocalInt(oPC, "CONV_RAGPICKER_GivenFinger");
    object oSeveredFinger = GetItemPossessedBy(oPC, "ww1_severedfinger");

    //if (bGivenFinger == FALSE)
    if (oSeveredFinger == OBJECT_INVALID)
    {
        CreateItemOnObject("severedfinger", oPC);
        SetLocalInt(oPC, "CONV_RAGPICKER_GivenFinger", TRUE);
    }

////////////////////////////
//////Distribute XP ////////
////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_AC_SeveredFinger";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 15;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
    string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
    //string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

//////Share XP & journal entry with every PC in the area? Default = FALSE
    int bShare = FALSE;

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
