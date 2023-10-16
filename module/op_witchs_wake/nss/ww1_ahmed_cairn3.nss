//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed's Cairn, Third Stone
//:: WW1_Ahmed_Cairn3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Creates the third cairn stone for Ahmed's
     burial
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    //Animate the player.
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 5.0));

    //Use the cairn in the Battlefield area to determine the locations for to be
    //used in this area.
    object oArea = GetArea(OBJECT_SELF);
    object oCairnStones3 = GetObjectByTag("Cairn");
    location lCairnStones3 = GetLocation(oCairnStones3);
    vector vCairnStones3 = GetPositionFromLocation(lCairnStones3);
    float fCairnStones3 = GetFacingFromLocation(lCairnStones3);
    location lNewCairnStone = Location(oArea, vCairnStones3, fCairnStones3);

    //Create the final cairn stone
    CreateObject(OBJECT_TYPE_PLACEABLE, "cairn", lNewCairnStone);

    //Flag the player as having built the cairn.
    SetLocalInt(oPC, "CONV_AHMED_BuiltCairn", TRUE);

    //Destroy the corpse.
    DestroyObject(OBJECT_SELF, 3.0);


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_RO_AhmedCairn3";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 13;

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
