//::///////////////////////////////////////////////
//:: The Lost City of Undrentide (OnEnter)
//:: En_Undrentide.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the initial journal entry.

    UPDATE -May 1 - Keith Warner
     Set a number on the PC on enter of the apprentice
    quarters so that in multi-player
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////

object GetJournalPC();
void GetPCsHenchman(object oPC);
void main()
{
    //Get the entering object
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE || GetIsDM(oPC) == TRUE)
    {
        return;
    }
    //The first time a PC enters the area (on start of the game)
    if (GetLocalInt(oPC, "nPCNumber") == 0)
    {
        // restore henchman story vars
        SetLocalInt(oPC, "XP1_Deekin_Story", GetCampaignInt("dbPlayers", "DeekinStory", oPC));
        SetLocalInt(oPC, "XP1_Dorna_Story", GetCampaignInt("dbPlayers", "DornaStory", oPC));
        SetLocalInt(oPC, "XP1_Xanos_Story", GetCampaignInt("dbPlayers", "XanosStory", oPC));
        //Update the calendar
        int bCalendarSet = GetLocalInt(OBJECT_SELF, "bCalendarSet");
        if (bCalendarSet == FALSE)
        {
            int nDay = GetCalendarDay() + (6*7) + 7;
            int nMonth = GetCalendarMonth();
            int nYear = GetCalendarYear();
            SetCalendar(nYear, nMonth, nDay);
            SetLocalInt(OBJECT_SELF, "bCalendarSet", TRUE);
        }

        //Add journal entry
        AddJournalQuestEntry("Journ_Main_10", 1, oPC);

        //Increment the module's PC count
        SetLocalInt(GetModule(), "nPCNumber", GetLocalInt(GetModule(), "nPCNumber") + 1);

        //Set the entering object's PC number
        SetLocalInt(oPC, "nPCNumber", GetLocalInt(GetModule(), "nPCNumber"));

        //Check this PC for a henchman...
        DelayCommand(2.0, GetPCsHenchman(oPC));

        DelayCommand(5.5, DoSinglePlayerAutoSave());
        //if oPC is Player 1 - do nothing else update journal entries if required.

        if (GetLocalInt(oPC, "nPCNumber") > 1)
        {
            //update journal entries - if needed.
            //find the lowest 'numbered' pc
            object oJournalPC = GetJournalPC();

            if (oJournalPC != OBJECT_INVALID)
            {
                //Add the journal entries from the lowest 'numbered' pc to the new pc
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_End") > 0)
                    AddJournalQuestEntry("Journ_Wizard_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_10") > 0)
                    AddJournalQuestEntry("Journ_Wizard_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_20") > 0)
                    AddJournalQuestEntry("Journ_Wizard_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_30") > 0)
                    AddJournalQuestEntry("Journ_Wizard_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_40") > 0)
                    AddJournalQuestEntry("Journ_Wizard_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_40"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_50") > 0)
                    AddJournalQuestEntry("Journ_Wizard_50", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_50"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_60") > 0)
                    AddJournalQuestEntry("Journ_Wizard_60", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_60"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_70") > 0)
                    AddJournalQuestEntry("Journ_Wizard_70", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Wizard_70"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_End") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_10") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_20") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_30") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_40") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_40"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_50") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_50", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_50"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_60") > 0)
                    AddJournalQuestEntry("Journ_Ashtara_60", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Ashtara_60"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_End") > 0)
                    AddJournalQuestEntry("Journ_Crypt_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_10") > 0)
                    AddJournalQuestEntry("Journ_Crypt_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_20") > 0)
                    AddJournalQuestEntry("Journ_Crypt_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_30") > 0)
                    AddJournalQuestEntry("Journ_Crypt_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_40") > 0)
                    AddJournalQuestEntry("Journ_Crypt_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_40"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_50") > 0)
                    AddJournalQuestEntry("Journ_Crypt_50", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Crypt_50"), oPC, FALSE);

                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_End") > 0)
                    AddJournalQuestEntry("Journ_Main_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_10") > 0)
                    AddJournalQuestEntry("Journ_Main_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_20") > 0)
                    AddJournalQuestEntry("Journ_Main_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_30") > 0)
                    AddJournalQuestEntry("Journ_Main_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_40") > 0)
                    AddJournalQuestEntry("Journ_Main_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Main_40"), oPC, FALSE);

                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_End") > 0)
                    AddJournalQuestEntry("Journ_Library_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_10") > 0)
                    AddJournalQuestEntry("Journ_Library_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_20") > 0)
                    AddJournalQuestEntry("Journ_Library_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_30") > 0)
                    AddJournalQuestEntry("Journ_Library_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_40") > 0)
                    AddJournalQuestEntry("Journ_Library_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_40"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_50") > 0)
                    AddJournalQuestEntry("Journ_Library_50", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_50"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_60") > 0)
                    AddJournalQuestEntry("Journ_Library_60", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_60"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_70") > 0)
                    AddJournalQuestEntry("Journ_Library_70", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_70"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_80") > 0)
                    AddJournalQuestEntry("Journ_Library_80", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_80"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_90") > 0)
                    AddJournalQuestEntry("Journ_Library_90", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_90"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_100") > 0)
                    AddJournalQuestEntry("Journ_Library_100", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_100"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_110") > 0)
                    AddJournalQuestEntry("Journ_Library_110", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Library_110"), oPC, FALSE);

                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_End") > 0)
                    AddJournalQuestEntry("Journ_Temple_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_10") > 0)
                    AddJournalQuestEntry("Journ_Temple_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_20") > 0)
                    AddJournalQuestEntry("Journ_Temple_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Temple_20"), oPC, FALSE);

                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_End") > 0)
                    AddJournalQuestEntry("Journ_Winds_End", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_End"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_10") > 0)
                    AddJournalQuestEntry("Journ_Winds_10", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_10"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_20") > 0)
                    AddJournalQuestEntry("Journ_Winds_20", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_20"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_30") > 0)
                    AddJournalQuestEntry("Journ_Winds_30", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_30"), oPC, FALSE);
                if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_40") > 0)
                    AddJournalQuestEntry("Journ_Winds_40", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYJourn_Winds_40"), oPC, FALSE);

            }
        }
    }
}

object GetJournalPC()
{
    int nFound = FALSE;
    int nPCNumber = 1;
    object oPC;
    object oJournalPC;
    while (nFound == FALSE)
    {
        oPC = GetFirstPC();
        while (oPC != OBJECT_INVALID && nFound == FALSE)
        {
            if (GetLocalInt(oPC, "nPCNumber") == nPCNumber)
            {
                oJournalPC = oPC;
                nFound = TRUE;

            }
            oPC = GetNextPC();
        }
        nPCNumber = nPCNumber + 1;
    }
    return oJournalPC;
}

void GetPCsHenchman(object oPC)
{
    location lHenchTarget1 = GetLocation(GetObjectByTag("wp_undrentide_henchstart"));
    object oHenchman = RetrieveCampaignObject("dbPlayers", "Henchman", lHenchTarget1, OBJECT_INVALID, oPC);
    if (GetIsObjectValid(oHenchman) == TRUE)
    {
        DeleteCampaignVariable("dbPlayers", "Henchman", oPC);
        effect ePetrify = EffectPetrify();
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePetrify, oHenchman));
        // Restore level-up status
        string sVarName;
        if(GetTag(oHenchman) == "x0_hen_xan")
            sVarName = "XanosLevelStatus";
        else if(GetTag(oHenchman) == "x0_hen_dor")
            sVarName = "DornaLevelStatus";
        else
            sVarName = "DeekinLevelStatus";

        SetLocalInt(oHenchman, "X0_L_LEVELRULES", GetCampaignInt("dbHenchmen", sVarName, oPC));
    }
}
