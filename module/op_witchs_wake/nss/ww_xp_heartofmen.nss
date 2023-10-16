//::///////////////////////////////////////////////
//:: Witchwork: XP Reward ("Fields of Battle Lie in the Hearts of Men")
//:: WW_XP_HeartOfMen.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     To give the player an XP reward, copy and
     rename this script, then fill in the details
     below.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 5, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oGhost = GetNearestObjectByTag("ww1_mineghost", OBJECT_SELF, 2);
    object oPC = GetPCSpeaker();
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);

    //Make the ghost stop her animation and face the player
    AssignCommand(oGhost, PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 1.0));
    AssignCommand(oGhost, SetFacingPoint(vPC));

/////////////////////////////////////////////////
//////Fill in the following information. ////////
/////////////////////////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_ST_HeartsOfMen";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 100;

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
