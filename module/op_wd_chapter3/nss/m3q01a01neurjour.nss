//::///////////////////////////////////////////////
//:: Give Journal
//:: M3Q01A01NEURJOUR.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Gives trial journal to players
*/
//:://////////////////////////////////////////////
//:: Created By:         Brent
//:: Created On:         November 13, 2001
//:://////////////////////////////////////////////


void main()
{
    CreateItemOnObject("M3Q1TrialBook",GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"TrialAccepted",1);
    AddJournalQuestEntry("M3Q1_TRIAL_PLOT",10,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q1_TRIALACCEPTED",1);
}
