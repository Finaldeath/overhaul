//::///////////////////////////////////////////////
//:: Witchwork 1: Rock Climb Up
//:: WW1_ClimbUp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jumps the player to the top of the promontory
     in the Night Hag's Cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oTarget = GetNearestObjectByTag("ClimbTop");

    AssignCommand(oPC, JumpToObject(oTarget));
    AssignCommand(oHenchman, JumpToObject(oTarget));
    AssignCommand(oFamiliar, JumpToObject(oTarget));
    AssignCommand(oAnimalCompanion, JumpToObject(oTarget));
    AssignCommand(oSummoned, JumpToObject(oTarget));

    SetMapPinEnabled(oTarget, TRUE);

    SetLocalInt(oPC, "CemeteryClimb", TRUE);

/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_CH_CemRockClimb";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 50;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
    //string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
    string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

//////Share XP & journal entry with every PC in the area? Default = FALSE
    int bShare = FALSE;

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
