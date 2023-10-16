//::///////////////////////////////////////////////
//:: Name q2_ent_trigfriens
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this trigger, the PC will notice one
    of his 'old friends' dead on the ground in front
    of him and have a journal entry created.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 12/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)  && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        int nJournal = GetLocalInt(GetModule(), "nFriendsFound");
        if (nJournal < 35)
            nJournal = nJournal + 5;
        if (nJournal == 50)
            nJournal = 80;
        if (nJournal == 60)
            nJournal = 90;
        if (nJournal == 70)
            nJournal = 99;
        SetLocalInt(GetModule(), "nFriendsFound", nJournal);
        AddJournalQuestEntry("q2oldfriends", nJournal, oPC);

    }
}
