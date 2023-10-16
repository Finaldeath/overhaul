//::///////////////////////////////////////////////
//:: Scrivener, Quest Not Yet Given (Condition Script)
//:: H2c_Scrv_NoQuest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener has not yet
     given the PC its quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bQuest = GetLocalInt(OBJECT_SELF, "bQuestGiven");
    if (bQuest == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
