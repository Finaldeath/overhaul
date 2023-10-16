//::///////////////////////////////////////////////
//:: Witchwork 1: Overhear Barrow Conversation
//:: WW1_BarrowConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the player has not crossed this trigger
     before, it launches a conversation between
     Jager Steinfaar and the Councilmen. Which
     conversation it launches depends on how
     many have already been overheard.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2002
//:://////////////////////////////////////////////
#include "ww_inc_rewardxp"
#include "ww1_inc_barrconv"

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        string sPCName = GetName(oPC);
        int bPCComplete = GetLocalInt(OBJECT_SELF, sPCName+"_Complete");
        object oJager = GetNearestObjectByTag("Jager", oPC);
        object oArea = GetArea(oPC);
        int iNumOverheard = GetLocalInt(oPC, "ww1_BarrowOverheard");
        int bSound = GetLocalInt(oArea, "bSound");
        string sConv;

        //If Jager is not in conversation, the player has not already overheard
        //something at this location, the player has not heard all three
        //potential conversations, and the conversation sounds are not still
        //underway....
        if (IsInConversation(oJager) == FALSE &&
            bPCComplete == FALSE &&
            bSound == FALSE &&
            iNumOverheard < 3)
        {
            //Define XP Reward Tag
            string sRewardTag;

            //Flag the player as having overheard something at this location.
            SetLocalInt(OBJECT_SELF, sPCName+"_Complete", TRUE);

            //Increment the number of conversations that they overheard.
            iNumOverheard++;
            SetLocalInt(oPC, "ww1_BarrowOverheard", iNumOverheard);

            //Determine which conversation Jager should use.
            switch (iNumOverheard)
            {
                case 1:
                {
                    sConv = "ww1_barrowconv_1";
                    sRewardTag = "XP_KN_BarrowConv1";
                }
                break;

                case 2:
                {
                    sConv = "ww1_barrowconv_2";
                    sRewardTag = "XP_KN_BarrowConv2";
                }
                break;

                case 3:
                {
                    sConv = "ww1_barrowconv_3";
                    sRewardTag = "XP_KN_BarrowConv3";
                }
                break;
            }

            //Launch the appropriate conversation.
            PlayBarrowConv(sConv);
//            AssignCommand(oJager, ActionStartConversation(oJager, sConv));

        /////////////////////////////
        //////Distribute XP. ////////
        /////////////////////////////

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
    }
}
