//::///////////////////////////////////////////////
//:: Witchwork: Tour of Sorrows OnEnter
//:: WW_Enter_Tour.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Makes the PC and all her associates
     invulnerable. This state is removed in the
     area's OnExit script.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"
#include "nw_i0_plot"

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

    if (GetIsPC(oEnterer) == TRUE)
    {
//////////Generic Witchwork Area OnEnter behavior...
        string sCharName = GetName(oEnterer);
        string sPlayerName = GetPCPlayerName(oEnterer);
        string sAreaName = GetName(OBJECT_SELF);
        string sAreaTag = GetTag(OBJECT_SELF);

        //Build and send message...
        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has entered "+
                            sAreaName+" ("+sAreaTag+").");
//////////Behavior specific to the Plane of Sorrows...
        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oEnterer);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oEnterer);
        object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oEnterer);
        effect eHealPC = EffectHeal(GetMaxHitPoints(oEnterer)+10);
        effect eHealHenchman = EffectHeal(GetMaxHitPoints(oHenchman)+10);
        effect eHealFamiliar = EffectHeal(GetMaxHitPoints(oFamiliar)+10);
        effect eHealAnimalCompanion = EffectHeal(GetMaxHitPoints(oAnimalCompanion)+10);

        //Flag them as invulnerable
        SetPlotFlag(oEnterer, TRUE);
        SetPlotFlag(oHenchman, TRUE);
        SetPlotFlag(oFamiliar, TRUE);
        SetPlotFlag(oAnimalCompanion, TRUE);

        //Set the player's camera to face Morrius
        AssignCommand(oEnterer, SetCameraFacing(180.0));

        //Do a delayed effects removal on them to catch any rare timing issues
        //that might leave them pooched in this area.
        DelayCommand(10.0, RemoveEffects(oEnterer));
        DelayCommand(10.0, RemoveEffects(oHenchman));
        DelayCommand(10.0, RemoveEffects(oFamiliar));
        DelayCommand(10.0, RemoveEffects(oAnimalCompanion));

        //Do a delayed healing on them to catch any rare timing issues that
        //might leave them dead in this area.
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealPC, oEnterer));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealHenchman, oHenchman));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealFamiliar, oFamiliar));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealAnimalCompanion, oAnimalCompanion));

        //Do a delayed ForceRest on them so they recover their spells & abilities.
        DelayCommand(10.0, ForceRest(oEnterer));
        DelayCommand(10.0, ForceRest(oHenchman));
        DelayCommand(10.0, ForceRest(oFamiliar));
        DelayCommand(10.0, ForceRest(oAnimalCompanion));
    }

/////////////////////////////
//////Distribute XP. ////////
/////////////////////////////

//////Give this XP Reward a unique Tag. No default.
    string sRewardTag = "XP_EX_TourOfSorrows";

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
