//::///////////////////////////////////////////////
//:: Ark of the 3 Winds (OnOpen)
//:: Op_ArkOfWinds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (iDoOnce == FALSE)
    {
        AddJournalQuestEntry("Journ_Temple_20", 1, oPC, TRUE, TRUE);
    }
}
