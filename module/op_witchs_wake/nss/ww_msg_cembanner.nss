//::///////////////////////////////////////////////
//:: Witchwork: Trigger Message (Cemetery Banner)
//:: WW_Msg_CemBanner.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A template script. Create a copy where
     sString = a custom message that will be sent
     from the server to any player entering the
     trigger or area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 11, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oEnterer = GetEnteringObject();
    string sPlayerID = GetPCPlayerName(oEnterer) + GetName(oEnterer);
    int bSeenOnce = GetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce");
    string sString = "You recognize this pennant, the starkness of the black "+
                     "on white. You can still remember them from the "+
                     "battlefield, their streaming tatters stained with red. "+
                     "Perhaps someone you once knew is buried here...";
    object oArea = GetArea(OBJECT_SELF);
    int bSound = GetLocalInt(oArea, "bSound");

    if (GetIsPC(oEnterer) == TRUE &&
        bSeenOnce == FALSE)
    {
        //Only fire if no other cemetery sounds are playing.
        if (bSound == FALSE)
        {
            //Flag the Cemetery Sound variable.
            SetLocalInt(oArea, "bSound", TRUE);

            //Play GUI sound
            object oVoice = GetNearestObjectByTag("ww1_narrator159", oEnterer);
            SoundObjectPlay(oVoice);
            DelayCommand(25.0, SoundObjectStop(oVoice));

            //Remove the Cemetery Sound variable once the sound is done
            DelayCommand(14.0, SetLocalInt(oArea, "bSound", FALSE));

            //Have the Player whisper the message to themselves.
            AssignCommand(oEnterer, SpeakString(sString, TALKVOLUME_WHISPER));

            //Flag the player as having seen the message.
            SetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce", TRUE);

        /////////////////////////////
        //////Distribute XP. ////////
        /////////////////////////////

        //////Give this XP Reward a unique Tag. No default.
            string sRewardTag = "XP_ST_CemBanner";

        //////Define the PC to be rewarded. No default.
            object oPC = oEnterer;

        //////Fill in the desired amount of XP. No default.
            int iXPReward = 25;

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
    }
}
