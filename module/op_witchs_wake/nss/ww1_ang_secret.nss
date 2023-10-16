//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar Tells His Secret
//:: WW1_Ang_Secret.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Angmar tells the player of his secret hiding
     place beneath the Elkentree. This flags the
     player so they're allowed to search it later.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_ANGMAR_Secret", TRUE);
    PaladinFalls(oPC);


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_CH_AngmarProvocation";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 25;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
    //string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
    string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

//////Share XP & journal entry with every PC in the area? Default = FALSE
    int bShare = TRUE;

//////Set this to TRUE if you want to add a journal entry. Default = FALSE
    int bAddJournal = FALSE;

//////If adding a journal entry, fill in the appropriate info below.
//////Defaults = sRewardTag, 10
    string sJournalTag = sRewardTag;
    int iJournalState = 10;

//////Call the included function
//    WW_RewardXP(sRewardTag, oPC, iXPReward, sExperienceType, bShare,
//                bAddJournal, sJournalTag, iJournalState);
}
