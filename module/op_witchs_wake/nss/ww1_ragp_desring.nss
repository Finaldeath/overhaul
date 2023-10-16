//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Destroy Rings
//:: WW1_Ragp_DesRing.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroy whatever ring the player is wearing
     and make the player stand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oPC = GetPCSpeaker();
    object oGoldRing = GetItemPossessedBy(oPC, "ww1_goldring");
    object oIronRing = GetItemPossessedBy(oPC, "ww1_ironring");

    DestroyObject(oGoldRing);
    DestroyObject(oIronRing);

    //Make the clone stand.
    object oClone2 = GetLocalObject(oPC, "oCut2_Clone");
    effect eEffect = GetFirstEffect(oClone2);
    int iEffectType = GetEffectType(eEffect);
    while (GetIsEffectValid(eEffect) != FALSE)
    {
        //Remove the paralyzation effect
        if (iEffectType == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oClone2, eEffect);
        }
        //Get the next effect
        eEffect = GetNextEffect(oClone2);
    }
    //Make the clone stand and face the ragpicker.
    vector vRagpicker = GetPosition(OBJECT_SELF);
    AssignCommand(oClone2, SetFacingPoint(vRagpicker));
    AssignCommand(oClone2, PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 5.0));

/////////////////////////////
//////Distribute XP//////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_CH_RagpSave";

//////Fill in the desired amount of XP. No default.
    int iXPReward = 35;

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
