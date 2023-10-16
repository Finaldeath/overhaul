//::///////////////////////////////////////////////
//:: Witchwork 1: Exhibit Door Pick Lock Script
//:: WW1_ExhibitPick.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Picking the lock when Helga can see them will
     always result in failure.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 1, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetLastUnlocked();
    object oHelga = GetNearestObjectByTag("Helga");
    int bSeen = GetObjectSeen(oPC, oHelga);
    string sMessage;
    string sSoundfile;
    int iVolume;

    //If the opener is a PC...
    if (GetIsPC(oPC) == TRUE)
    {
        //Handle Paladin attempts to pick the lock.
        PaladinFalls(oPC);

        //If Helga can currently see the player...
        if (bSeen == TRUE)
        {
            //Relock the door and give the failure message.
            AssignCommand(oPC, ClearAllActions());
            SetLocked(OBJECT_SELF, TRUE);
            sMessage = "Helga spots you hunched over the lock. She gives you "+
                        "the evil eye before continuing her wanderings.";
            iVolume = TALKVOLUME_TALK;
            sSoundfile = "ww1_narrator191";
        }
        //If Helga can't currently see the player...
        else
        {
            //Allow the lockpick to proceed and give the success message.
            sMessage = "You manage to evade Helga's gaze and unlock the door "+
                        "unnoticed.";
            iVolume = TALKVOLUME_TALK;
            sSoundfile = "ww1_narrator192";


        /////////////////////////////
        //////Distribute XP. ////////
        /////////////////////////////

        //////Give this XP Reward a unique Tag. No default.
            string sRewardTag = "XP_CH_ExhibitDoor";

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
    }

    //If the opener is the DM...
/*    if (GetIsDM(oPC) == TRUE)
    {
        //Unlock the door and give them the DM message.
        SetLocked(OBJECT_SELF, TRUE);
        sMessage = "Door unlocked by Dungeon Master.";
        iVolume = TALKVOLUME_WHISPER;
    }
*/
    object oVoice = GetNearestObjectByTag(sSoundfile, oPC);
    SoundObjectPlay(oVoice);
    DelayCommand(25.0, SoundObjectStop(oVoice));

    AssignCommand(oPC, SpeakString(sMessage, iVolume));
}
