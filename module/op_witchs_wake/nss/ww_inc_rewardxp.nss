//::///////////////////////////////////////////////
//:: Witchwork: Reward XP Include
//:: WW_Inc_RewardXP.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A system to help with XP distribution.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 6, 2002
//:://////////////////////////////////////////////

void WW_RewardXP(string sRewardTag, object oPC, int iXPReward,
                 string sExperienceType = "", int bShare = FALSE,
                 int bAddJournal = FALSE, string sJournalTag = "",
                 int iJournalState = 10)
{
    //Return with an error message if oPC is invalid.
    if (oPC == OBJECT_INVALID)
    {
        string sDebug = "WW_Inc_RewardXP failed because oPC == OBJECT_INVALID";
        object oShouter = GetNearestObject(OBJECT_TYPE_CREATURE);
        AssignCommand(oShouter, SpeakString(sDebug, TALKVOLUME_SHOUT));
        return;
    }

    location lPC = GetLocation(oPC);
    int iNth = 0;

    //If sExperienceType is set to default, set it to a generic story reward.
    if (sExperienceType == "")
    {
        sExperienceType = "You furthered the story...";
    }

    //If sJournalTag is set to default, use sRewardTag
    if (sJournalTag == "")
    {
        sJournalTag = sRewardTag;
    }

    //Use a do/while loop to handle whether or not it's shared with multiple PCs
    do
    {
        //if the PC hasn't already received this reward...
        int bRewardReceived = GetLocalInt(oPC, sRewardTag);
        if (bRewardReceived == FALSE)
        {
            //Play Sound
            AssignCommand(oPC, PlaySound("gui_spell_mem"));

            //Send Reward Message
            SendMessageToPC(oPC, sExperienceType);

            //Award XP (modify for subraces)
            GiveXPToCreature(oPC, iXPReward);

            //Add journal entry if requested above.
            if (bAddJournal == TRUE)
            {
                AddJournalQuestEntry(sJournalTag, iJournalState, oPC);
            }

            //Notify DMs.
            string sPCName = GetName(oPC);
            string sPlayerName = GetPCPlayerName(oPC);
            string sXPReward = IntToString(iXPReward);
            int iClass1Level = GetLevelByPosition(1, oPC);
            int iClass2Level = GetLevelByPosition(2, oPC);
            int iClass3Level = GetLevelByPosition(3, oPC);
            int iTotalLevel = iClass1Level + iClass2Level + iClass3Level;
            string sTotalLevel = IntToString(iTotalLevel);
            int iCurrentXP = GetXP(oPC);
            string sCurrentXP = IntToString(iCurrentXP);
            string sDMMessage = sPCName+" ["+sPlayerName+"] just gained "+sXPReward+
                                " XP. They are currently at Level "+sTotalLevel+
                                " ["+sCurrentXP+" XP].";
            SendMessageToAllDMs(sDMMessage);

            //Flag player as having now received this XP Reward.
            SetLocalInt(oPC, sRewardTag, TRUE);
        }

        //If bShare == TRUE, get the next PC in area that hasn't received the
        //reward. Otherwise skip it to keep things optimized.
        if (bShare == TRUE)
        {
            oPC = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, lPC, iNth);
            bRewardReceived = GetLocalInt(oPC, sRewardTag);
            while (bRewardReceived == TRUE &&
                   oPC != OBJECT_INVALID)
            {
                iNth++;
                oPC = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, lPC, iNth);
                bRewardReceived = GetLocalInt(oPC, sRewardTag);
            }
        }
    }
    while (bShare == TRUE &&
           oPC != OBJECT_INVALID);
}
