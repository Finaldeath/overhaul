//::///////////////////////////////////////////////
//:: Witchwork: Trigger Message, Mines Scrawl #2
//:: WW_Msg_Mines02.nss
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
//:: Created On: October 31, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"

void main()
{
    object oEnterer = GetEnteringObject();
    string sPlayerID = GetPCPlayerName(oEnterer) + GetName(oEnterer);
    int bSeenOnce = GetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce");
    string sPCName = GetName(oEnterer);
    string sString = "A chalk message looms out of the darkness like a ghost: "+
                     "'"+sPCName+" promised to look after the Prince.'";
    object oArea = GetArea(OBJECT_SELF);
    int bSound = GetLocalInt(oArea, "bSound");

/*DEBUG*///if (GetIsPC(oEnterer))
    if (GetIsPC(oEnterer) == TRUE &&
        bSeenOnce == FALSE)
    {
        //Do a Search Check...
        //Declare the values used in the Ability Check
        object oPC = oEnterer;
        int iDC = 8;
        int iD20 = Random(20)+1;
        if (GetDetectMode(oPC) == DETECT_MODE_PASSIVE)
        {
            iD20 = Random(10)+1;
        }
        int iIntMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
        int iSearch = GetSkillRank(SKILL_SEARCH, oPC);
        int iRace = GetRacialType(oPC);
        int iRaceBonus = 0;
        if (iRace == RACIAL_TYPE_DWARF ||
            iRace == RACIAL_TYPE_ELF)
        {
            iRaceBonus = 2;
        }
        else if (iRace == RACIAL_TYPE_HALFELF)
        {
            iRaceBonus = 1;
        }

        //Create the final Check calculation.
        int iCheck = iD20 + iIntMod + iSearch + iRaceBonus;

        //If the PC's Check >= DC, they succeed.
/*DEBUG*///if (TRUE)
        if (iCheck >= iDC)
        {
            //Only fire if no other sounds are playing.
            if (bSound == FALSE)
            {
                //Flag the Sound variable.
                SetLocalInt(oArea, "bSound", TRUE);

                //Flag them for database purposes.
                SetLocalInt(oEnterer, "MSG_MINE_SCRAWL_2", TRUE);
                //Send Check feedback.
                string sDC = IntToString(iDC);
                string sCheck = IntToString(iCheck);
                string sBroadcast = "Search Check: You roll: "+sCheck+" vs. DC "+sDC;
                SendMessageToPC(oPC, sBroadcast);

                //Play GUI sound
                AssignCommand(oEnterer, PlaySound("gui_spell_mem"));

                //Remove the Sound variable once the sound is done
                DelayCommand(0.0, SetLocalInt(oArea, "bSound", FALSE));

                //Have the Player whisper the message to themselves.
                AssignCommand(oEnterer, SpeakString(sString, TALKVOLUME_WHISPER));

            /////////////////////////
            //////Reward XP. ////////
            /////////////////////////

            //////Give this XP Reward a unique Tag. No default.
                string sRewardTag = "XP_KN_MinesMessage02";

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

            //Flag the player as having seen the message.
            SetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce", TRUE);
            }
        }
    }
}
