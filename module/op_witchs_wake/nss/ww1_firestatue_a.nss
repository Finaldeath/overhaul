//::///////////////////////////////////////////////
//:: Witchwork 1: Fire Statue Action Script
//:: WW1_FireStatue_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the statue to cast the Flame Lash
     spell at the nearest kobold.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 17, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oFireStatue = GetNearestObjectByTag("ww1_FireStatue");
    object oTarget = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, oFireStatue);
    float fDistance = GetDistanceToObject(oTarget);

    //If the nearest kobold is over 10 meters away, use a null fire target instead.
    if (fDistance > 10.0)
    {
        oTarget = GetNearestObjectByTag("ww1_FireTarget");
    }

    //Cast Spell
    AssignCommand(oFireStatue, ActionCastSpellAtObject(SPELL_FLAME_LASH, oTarget, METAMAGIC_NONE, TRUE));

/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_KN_FireStatue";

//////Define the PC to be rewarded. No default.
    object oPC = GetPCSpeaker();

//////Fill in the desired amount of XP. No default.
    int iXPReward = 25;

//////Comment in the appropriate experience type. Default = "You furthered the
//////story..."
    //string sExperienceType = "You furthered the story..."; /*(ST) STORY*/
    //string sExperienceType = "You discovered a new area..."; /*(EX) EXPLORATION*/
    string sExperienceType = "You learned something new..."; /*(KN) KNOWLEDGE*/
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
