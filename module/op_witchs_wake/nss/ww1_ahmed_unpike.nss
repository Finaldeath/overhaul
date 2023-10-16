//::///////////////////////////////////////////////
//:: Witchwork 1: Prince Ahmed, Remove from Pike
//:: WW1_Ahmed_Unpike.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroy the corpse-on-pike object and create
     a separate pike and corpse.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void CreateCorpseAndPike(location lCorpse, location lPike)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "ww1_ahmedcorpse", lCorpse);
    CreateObject(OBJECT_TYPE_ITEM, "ww1_ahmedpike", lPike);
}

void main()
{
    object oArea = GetArea(OBJECT_SELF);

    //Use the cairn in the Battlefield area to determine the corpse location.
    object oCairn = GetObjectByTag("Cairn");
    location lCairn = GetLocation(oCairn);
    vector vCairn = GetPositionFromLocation(lCairn);
    float fCairn = GetFacingFromLocation(lCairn); //Rotated 180* below.
    location lCorpse = Location(oArea, vCairn, fCairn + 180.0);

    //Use the Ragpicker's Store to determine the Pike location.
    object oStore = GetNearestObjectByTag("RagpickersStore");
    location lPike = GetLocation(oStore);

    //Assign the creation to the area so the corpse-on-pike can be destroyed
    //first.
    AssignCommand(oArea, DelayCommand(1.5, CreateCorpseAndPike(lCorpse, lPike)));

    //Destroy Corpse-On-Pike
    DestroyObject(OBJECT_SELF, 1.0);


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_RO_AhmedUnpike";

//////Define the PC to be rewarded. No default.
    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = 35;

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
