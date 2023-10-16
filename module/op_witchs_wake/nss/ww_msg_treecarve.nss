//::///////////////////////////////////////////////
//:: Witchwork: Trigger Message (Tree Carving)
//:: WW_Msg_TreeCarve.nss
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
//:: Created On: November 14, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oEnterer = GetEnteringObject();
    string sTarot = GetLocalString(oEnterer, "CONV_NIGHTHAG_Warlock'sHand");

    if (sTarot == "Passion")
    {
        string sName = GetName(oEnterer);
        string sPlayerID = GetPCPlayerName(oEnterer) + sName;
        string sFirstInitial = GetStringLeft(sName, 1);

        //Try to determine last initial...
        int nFromRight = 1;
        string sLastInitial = GetStringRight(sName, nFromRight);
        while (sLastInitial != " " &&
               sLastInitial != "")
        {
            nFromRight++;
            sLastInitial = GetStringLeft(GetStringRight(sName, nFromRight), 1);
        }
        if (sLastInitial == " ") //If you find a space, go back one to get the initial.
        {
            nFromRight--;
            sLastInitial = GetStringLeft(GetStringRight(sName, nFromRight), 1);
        }

        //Create sString
        string sString = "Someone has carved a heart into the bark of this "+
                         "tree. The cuts seem recent. Inside the heart are "+
                         "the letters '"+sFirstInitial+sLastInitial+" + 'AB'";

        //Play GUI sound
        AssignCommand(oEnterer, PlaySound("gui_spell_mem"));

        //Have the Player whisper the message to themselves.
        AssignCommand(oEnterer, SpeakString(sString, TALKVOLUME_WHISPER));

        //Flag the player as having seen the message.
        SetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce", TRUE);


    /////////////////////////////
    //////Distribute XP. ////////
    /////////////////////////////

    //////Give this XP Reward a unique Tag. No default.
        string sRewardTag = "XP_KN_PassionCarving";

    //////Define the PC to be rewarded. No default.
        object oPC = oEnterer;

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
