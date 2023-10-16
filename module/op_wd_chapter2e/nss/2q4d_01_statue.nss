//::///////////////////////////////////////////////
//:: Name
//:: 2q4d_01_Statue
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script displays a string when the object
    is used.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oUsed = GetLastUsedBy();

    if (GetIsPC(oUsed))
    {
        if (GetLocalInt(oUsed,"NW_JOURNAL_ENTRYm2q4_Illusk") < 10)
        {
            AddJournalQuestEntry("m2q4_Illusk",10,oUsed);
        }
        SpeakOneLinerConversation();
    }
}
