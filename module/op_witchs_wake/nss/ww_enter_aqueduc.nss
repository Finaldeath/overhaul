//::///////////////////////////////////////////////
//:: Witchwork: Aqueducts OnEnter
//:: WW_Enter_Aqueduct.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Send a message to any DMs, informing them of
     the player's new location.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 23, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void DMInform(object oEnterer)
{
    //Only track player movement.
    if (GetIsPC(oEnterer) == TRUE)
    {
        string sCharName = GetName(oEnterer);
        string sPlayerName = GetPCPlayerName(oEnterer);
        string sAreaName = GetName(OBJECT_SELF);
        string sAreaTag = GetTag(OBJECT_SELF);

        //Build and send message...
        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has entered "+
                            sAreaName+" ("+sAreaTag+").");
    }
}

void main()
{
    object oEnterer = GetEnteringObject();

    //Inform DM of player movement
    DMInform(oEnterer);


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_EX_Aqueducts";

//////Define the PC to be rewarded. No default.
    object oPC = oEnterer;

//////Fill in the desired amount of XP. No default.
    int iXPReward = 50;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    //string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
    //string sExperienceType = "You roleplayed your character..."; /*(RO) ROLEPLAY*/
    //string sExperienceType = "You acquired an item of interest..."; /*(AC) ACQUISITION*/
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
