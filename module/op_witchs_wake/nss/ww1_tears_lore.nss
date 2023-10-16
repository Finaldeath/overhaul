//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, Lore Check
//:: WW1_Tears_Lore.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Lore Check and broadcasts a
    feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oPC = GetPCSpeaker();

    //Declare the values used in the Ability Check
    int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
    int iD20 = Random(20)+1;
    int iIntMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int iLore = GetSkillRank(SKILL_LORE, oPC);

    //Create the final Check calculation.
    int iCheck = iD20 + iIntMod + iLore;

    //Convert the above Ints to Strings in preparation for broadcast.
    string sDC = IntToString(iDC);
    string sCheck = IntToString(iCheck);
    string sBroadcast = "You roll: "+sCheck+" vs. DC "+sDC;

    //If the PC's Check >= DC, they succeed.
    if (iCheck >= iDC)
    {
        SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Success");

    /////////////////////////////
    //////Distribute XP. ////////
    /////////////////////////////

    //////Give this XP Reward a unique Tag. No default.
        string sRewardTag = "XP_ST_TranslateScrawl";

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
    //If not, they fail.
    else
    {
        SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Failure");
    }
    SendMessageToPC(oPC, sBroadcast);
}
