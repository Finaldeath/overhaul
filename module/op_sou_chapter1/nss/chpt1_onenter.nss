//::///////////////////////////////////////////////
//:: Name: q1a2_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set a number on the PC on enter of the apprentice
    quarters so that in multi-player - extra pcs
    are jumped to a different room...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 10/03
//:://////////////////////////////////////////////
object GetJournalPC();

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
        //Increment the module's PC count

        SetLocalInt(GetModule(), "nPCNumber", GetLocalInt(GetModule(), "nPCNumber") + 1);

        //Set the entering object's PC number
        SetLocalInt(oPC, "nPCNumber", GetLocalInt(GetModule(), "nPCNumber"));
        //Increment the module's PC count
        object oJournalPC = GetJournalPC();

        if (oJournalPC != OBJECT_INVALID)
        {
            //Add the journal entries from the lowest 'numbered' pc to the new pc
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1cure") > 0)
                AddJournalQuestEntry("q1cure", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1cure"), oPC, FALSE);

            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_KOBOLDS") > 0)
                AddJournalQuestEntry("Q2_JOURNAL_KOBOLDS", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_KOBOLDS"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1gprophet") > 0)
                AddJournalQuestEntry("q1gprophet", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1gprophet"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1dcook") > 0)
                AddJournalQuestEntry("q1dcook", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1dcook"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bhalfling") > 0)
                AddJournalQuestEntry("q1bhalfling", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bhalfling"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bfamily") > 0)
                AddJournalQuestEntry("q1bfamily", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bfamily"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYjt_q5blocked") > 0)
                AddJournalQuestEntry("jt_q5blocked", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYjt_q5blocked"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1foot_horns") > 0)
                AddJournalQuestEntry("q1foot_horns", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1foot_horns"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_GLENDIR") > 0)
                AddJournalQuestEntry("Q3_JOURNAL_GLENDIR", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_GLENDIR"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1footrumgut") > 0)
                AddJournalQuestEntry("q1footrumgut", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1footrumgut"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_SPIDERS") > 0)
                AddJournalQuestEntry("Q2_SPIDERS", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_SPIDERS"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bthay") > 0)
                AddJournalQuestEntry("q1bthay", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1bthay"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_tooth") > 0)
                AddJournalQuestEntry("q1_artifact_tooth", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_tooth"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_ELVEN_TEST") > 0)
                AddJournalQuestEntry("Q2_JOURNAL_ELVEN_TEST", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_ELVEN_TEST"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_GNOLL_SLAVES") > 0)
                AddJournalQuestEntry("Q3_JOURNAL_GNOLL_SLAVES", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_GNOLL_SLAVES"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_KOBOLD_PRISONERS") > 0)
                AddJournalQuestEntry("Q3_JOURNAL_KOBOLD_PRISONERS", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ3_JOURNAL_KOBOLD_PRISONERS"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_LOST_SWORD") > 0)
                AddJournalQuestEntry("Q2_JOURNAL_LOST_SWORD", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYQ2_JOURNAL_LOST_SWORD"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_mask") > 0)
                AddJournalQuestEntry("q1_artifact_mask", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_mask"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1artifacts") > 0)
                AddJournalQuestEntry("q1artifacts", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1artifacts"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_hand") > 0)
                AddJournalQuestEntry("q1_artifact_hand", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_hand"), oPC, FALSE);
            if (GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_statue") > 0)
                AddJournalQuestEntry("q1_artifact_statue", GetLocalInt(oJournalPC, "NW_JOURNAL_ENTRYq1_artifact_statue"), oPC, FALSE);
        }

        AddJournalQuestEntry("q1_chapter1", 10, oPC);


        //if oPC is Player 1 - the cutscene will proceed,
        //if the entering PC is not Player 1 - jump them to the inn room to wait for
        //Player 1 to finish the cutscene


    }

}

object GetJournalPC()
{

    int nFound = FALSE;
    int nPCNumber = 1;
    object oPC1;
    object oJournalPC1;
    while (nFound == FALSE)
    {
        oPC1 = GetFirstPC();
        while (oPC1 != OBJECT_INVALID && nFound == FALSE)
        {
            if (GetLocalInt(oPC1, "nPCNumber") == nPCNumber)
            {
                oJournalPC1 = oPC1;
                nFound = TRUE;

            }
            oPC1 = GetNextPC();
        }
        nPCNumber = nPCNumber + 1;
    }
    return oJournalPC1;
}
