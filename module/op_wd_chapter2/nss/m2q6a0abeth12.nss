//::///////////////////////////////////////////////
//:: m2q6a0 Aribeth Conversation Script #12
//:: m2q6a0abeth12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets a local to indicate the player now knows
    about the cult. Also handles all party journal
    entries about the incriminating Cult Journals
    and updates the main journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Unknown
//:: Created On: Unknown
//:: Last Updated By: Rob Bartel
//:: Last Updated On: Feb 22, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oInfo = GetLocalObject(OBJECT_SELF,"NW_L_TakeJournal");
    object oPC = GetPCSpeaker();
    object oCultJournal = GetItemPossessedBy(oPC,"M2Q3G_CULTJOURN");
    object oRelmarJournal = GetItemPossessedBy(oPC,"M2Q2GJRNRELMAR");
    object oVardocJournal = GetItemPossessedBy(oPC,"M2Q1VARDLET");

    int iGiven = GetLocalInt(OBJECT_SELF,"Journals_Given");
    int iVardocState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q1_Vardoc");
    int iRelmarState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q0_RelmarCult");
    int iCharwoodCultState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q0_CharwoodCult");
//    object oJournal1 = GetItemPossessedBy(GetPCSpeaker(),"M2Q3G_CULTJOURN");
//Edit *1  object oJournal2 = GetItemPossessedBy(GetPCSpeaker(),"M2Q5CULTJRNL");
//    object oJournal3 = GetItemPossessedBy(GetPCSpeaker(),"M2Q2GJRNRELMAR");
//    object oJournal4 = GetItemPossessedBy(GetPCSpeaker(),"M2Q1VARDLET");


    ActionPauseConversation();
    SetLocalInt(OBJECT_SELF,"Journals_Given",(iGiven + 1));
    SetLocalInt(GetModule(),"Chapter2_Know_Cult",1);

    if (GetIsObjectValid(oCultJournal) && oInfo != oCultJournal)
    {
        AddJournalQuestEntry("m2q0_CharwoodCult", 30, oPC);
        DestroyObject(oCultJournal);
    }
    if (GetIsObjectValid(oRelmarJournal) && oInfo != oRelmarJournal)
    {
        AddJournalQuestEntry("m2q0_RelmarCult", 30, oPC);
        DestroyObject(oRelmarJournal);
    }
    if (GetIsObjectValid(oVardocJournal) && oInfo != oVardocJournal)
    {
        AddJournalQuestEntry("m2q1_Vardoc", 60, oPC);
        DestroyObject(oVardocJournal);
    }

    DestroyObject(oInfo);
    oInfo = OBJECT_INVALID;
    AddJournalQuestEntry("m2q0_Main", 30, oPC);
    RewardXP("m2q0_Main",100, GetPCSpeaker());

//Edit *1  int iGanonState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q0_GanonCult");

    if (iVardocState == 45)
    {
        AddJournalQuestEntry("m2q1_Vardoc", 50, oPC);
    }

    if (iRelmarState == 15)
    {
        AddJournalQuestEntry("m2q0_RelmarCult", 20, oPC);
    }

    if (iCharwoodCultState == 15)
    {
        AddJournalQuestEntry("m2q0_CharwoodCult", 20, oPC);
    }

// Edit *1
/*  if (iGanonState == 10)
    {
        AddJournalQuestEntry("m2q0_Ganon", 20, oPC);
    }*/
//    ActionPauseConversation();
//    ActionTakeItem(oJournal1,oPC);
//Edit *1  ActionTakeItem(oJournal2,oPC);
//    ActionTakeItem(oJournal3,oPC);
//    ActionTakeItem(oJournal4,oPC);
//    DestroyObject(oJournal1);
//Edit *1  DestroyObject(oJournal2);
//    DestroyObject(oJournal3);
//    DestroyObject(oJournal4);
//    ActionResumeConversation();

// Edit *1 - Gannon's Journal is no longer a plot item.
    ActionResumeConversation();
}
