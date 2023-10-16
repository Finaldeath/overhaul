//::///////////////////////////////////////////////
//:: Witchwork: Mines Ethereal Leak Trigger Message
//:: WW_Msg_MinesLeak.nss
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
    string sString = "You stumble into the writhing mass of negative energy. "+
                     "Its tendrils embrace you, burrowing beneath your flesh. "+
                     "As you lay there, you spy a message written in chalk "+
                     "upon the wall. It reads 'My name is Caldrian Ayre.'";
    object oArea = GetArea(OBJECT_SELF);
    int bSound = GetLocalInt(oArea, "bSound");

    if (GetIsPC(oEnterer) == TRUE &&
        bSeenOnce == FALSE)
    {
        //Flag the Sound variable.
        SetLocalInt(oArea, "bSound", TRUE);

        //Play GUI sound
        object oVoice = GetNearestObjectByTag("ww1_narrator180", oEnterer);
        DelayCommand(2.0, SoundObjectPlay(oVoice));
        DelayCommand(27.0, SoundObjectStop(oVoice));

        //Remove the Sound variable once the sound is done
        DelayCommand(17.0, SetLocalInt(oArea, "bSound", FALSE));

        //Have the Player whisper the message to themselves.
        AssignCommand(oEnterer, SpeakString(sString, TALKVOLUME_WHISPER));

        //Flag the player as having seen the message.
        SetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce", TRUE);

///////////////////////////////////////////////
//Additional behavior custom to this message...
///////////////////////////////////////////////

        //Set the Player's Camera Mode and initial facing.
        DelayCommand(0.1, AssignCommand(oEnterer, SetCameraFacing(90.0)));

        //Sound of door closing.
        DelayCommand(1.5, AssignCommand(oEnterer, PlaySound("as_dr_metlmedcl1")));

        //Knock them down.
        AssignCommand(oEnterer, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 10.0));

        //Fade from Black
        DelayCommand(2.0, FadeFromBlack(oEnterer, FADE_SPEED_SLOWEST));

        //Flag the Ethereal Leak as being activated.
        object oLeak = GetNearestObjectByTag("EtherealLeak");
        SetLocalObject(GetModule(), "oEtherealLeak", oLeak);
        SetLocalInt(oLeak, "bUsed", TRUE);
        SetLocalInt(GetModule(), "bMinesLeakActivated", TRUE);

    //////Assign the Ethereal Leak's XP
    //////Give this XP Reward a unique Tag. No default.
        int bActivated = GetLocalInt(oLeak, "bActivated");
        int iLeaksActivated = GetLocalInt(GetModule(), "iLeaksActivated");
        if (bActivated == FALSE)
        {
            iLeaksActivated++;
            SetLocalInt(GetModule(), "iLeaksActivated", iLeaksActivated);
            SetLocalInt(oLeak, "bActivated", TRUE);
        }
        string sLeaksActivated = IntToString(iLeaksActivated);
        string sRewardTag = "XP_ST_EtherealLeak_"+sLeaksActivated;

    //////Define the PC to be rewarded. No default.
        object oPC = oEnterer;

    //////Fill in the desired amount of XP. No default.
        int iXPReward = iLeaksActivated * 25;

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
