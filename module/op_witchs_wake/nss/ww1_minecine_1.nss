//::///////////////////////////////////////////////
//:: Witchwork 1: Mine Cinematic, Script #1
//:: WW1_MineCine_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launches the Mine Cinematic
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void LaunchConversation(object oPC)
{
    //Create the invisible conversation holder
//    object oJager = GetNearestObjectByTag("Cine2Jager");
//    location lJager = GetLocation(oJager);
//    object oJagerInvis = CreateObject(OBJECT_TYPE_PLACEABLE, "jagerinvis2", lJager);

    //Save it out as a local object on the player for future reference.
//    SetLocalObject(oPC, "oJagerInvis2", oJagerInvis);

    //Launch Conversation
    AssignCommand(oPC, ClearAllActions(TRUE));
    DelayCommand(1.0, AssignCommand(oPC, ActionStartConversation(oPC, "ww1_minecine", TRUE, FALSE)));
}

void main()
{
    object oPC = GetEnteringObject();

    //Do the following only for PCs
    if (GetIsPC(oPC) == TRUE)
    {
        //Set the camera shot
        SetCameraHeight(oPC, 1.5);
        AssignCommand(oPC, SetCameraFacing(315.0, 7.5, 89.0));

        //Launch conversation
        DelayCommand(1.0, LaunchConversation(oPC));
    }


/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_ST_MineCinematic";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 40;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
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
