//::///////////////////////////////////////////////
//:: Witch Wake 1: Module OnAcquire
//:: WW1_OnAcquire.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the acquisition of all important items
     in WW1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2003
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"
#include "ww1_inc_paladin"

void main()
{
    object oItem = GetModuleItemAcquired();
    object oPC = GetItemPossessor(oItem);
    string sTag = GetTag(oItem);
    object oAcquiredFrom = GetModuleItemAcquiredFrom();

    //Ensure it's the PC
    if (GetIsPC(oPC) == TRUE)
    {
        //Bridge Key
        if (sTag == "ww1_BridgeKey")
        {
            //Destroy the sparkly.
            object oSparkly = GetObjectByTag("ww1_BridgeKey_Sparkly");
            DestroyObject(oSparkly);
        }

        //If the item is the Chisel for the Memorial Quest
        if (sTag == "ww1_Chisel")
        {
            /////////////////////////////
            //////Distribute XP. ////////
            /////////////////////////////

            //Give this XP Reward a unique Tag. No default.
            string sRewardTag = "XP_AC_Chisel";

            //Fill in the desired amount of XP. No default.
            int iXPReward = 15;

            /////Comment in the appropriate experience type. Default = "You furthered the
            /////story..."
            //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
            //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
            //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
            //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
            string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
            //string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

            //Share XP & journal entry with every PC in the area? Default = FALSE
            int bShare = TRUE;

            //Set this to TRUE if you want to add a journal entry. Default = FALSE
            int bAddJournal = FALSE;

            //If adding a journal entry, fill in the appropriate info below.
            //Defaults = sRewardTag, 10
            string sJournalTag = sRewardTag;
            int iJournalState = 10;

            //Call the included function
            WW_RewardXP(sRewardTag, oPC, iXPReward, sExperienceType, bShare,
                        bAddJournal, sJournalTag, iJournalState);
        }

        //If the item is Morrius' Axe, Witchbane
        if (sTag == "ww1_Witchbane")
        {
            /////////////////////////////
            //////Distribute XP. ////////
            /////////////////////////////

            //Give this XP Reward a unique Tag. No default.
            string sRewardTag = "XP_AC_Witchbane";

            //Fill in the desired amount of XP. No default.
            int iXPReward = 35;

            /////Comment in the appropriate experience type. Default = "You furthered the
            /////story..."
            //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
            //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
            //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
            //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
            string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
            //string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

            //Share XP & journal entry with every PC in the area? Default = FALSE
            int bShare = TRUE;

            //Set this to TRUE if you want to add a journal entry. Default = FALSE
            int bAddJournal = FALSE;

            //If adding a journal entry, fill in the appropriate info below.
            //Defaults = sRewardTag, 10
            string sJournalTag = sRewardTag;
            int iJournalState = 10;

            //Call the included function
            WW_RewardXP(sRewardTag, oPC, iXPReward, sExperienceType, bShare,
                        bAddJournal, sJournalTag, iJournalState);
        }

        //If the item is the Night Hag's Levitation Fetish
        if (sTag == "ww1_levfetish")
        {
            /////////////////////////////
            //////Distribute XP. ////////
            /////////////////////////////

            //Give this XP Reward a unique Tag. No default.
            string sRewardTag = "XP_AC_LevitationFetish";

            //Fill in the desired amount of XP. No default.
            int iXPReward = 15;

            /////Comment in the appropriate experience type. Default = "You furthered the
            /////story..."
            //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
            //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
            //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
            //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
            string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
            //string sExperienceType = "You used your abilities successfully..."; /*(CH) CHECK*/

            //Share XP & journal entry with every PC in the area? Default = FALSE
            int bShare = TRUE;

            //Set this to TRUE if you want to add a journal entry. Default = FALSE
            int bAddJournal = FALSE;

            //If adding a journal entry, fill in the appropriate info below.
            //Defaults = sRewardTag, 10
            string sJournalTag = sRewardTag;
            int iJournalState = 10;

            //Call the included function
            WW_RewardXP(sRewardTag, oPC, iXPReward, sExperienceType, bShare,
                        bAddJournal, sJournalTag, iJournalState);
        }

        //If the item is one of the cemetery grave goods
        if (sTag == "ww1_gravehelm" ||
            sTag == "ww1_graveaxe" ||
            sTag == "ww1_gravesword")
        {
            //...and the player is currently in the cemetery (best way to judge
            //if they're stealing it or obtaining it second-hand)
            object oArea = GetArea(oPC);
            string sAreaTag = GetTag(oArea);
            if (sAreaTag == "MountainCemetery")
            {
                //Send Warning to Paladin.
                int iPaladin = GetLevelByClass(CLASS_TYPE_PALADIN, oPC);
                int iGoodEvil = GetAlignmentGoodEvil(oPC);
                int iLawChaos = GetAlignmentLawChaos(oPC);
                if (iPaladin > 0 &&
                    iGoodEvil == ALIGNMENT_GOOD &&
                    iLawChaos == ALIGNMENT_LAWFUL)
                {
                    string sWarning = "WARNING! This item has been placed here "+
                                      "to honor the dead. It would be "+
                                      "unbefitting a Paladin to claim it as "+
                                      "your own.";
                    FloatingTextStringOnCreature("WARNING!", oPC, FALSE);
                    SendMessageToPC(oPC, sWarning);
                }
            }
        }

        //If the item is the translated Tears message
        if (sTag == "ww1_scrawltrans")
        {
            AddJournalQuestEntry("WW_TearsUntranslated", 20, oPC, FALSE);
        }
    }
}
