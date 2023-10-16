//::///////////////////////////////////////////////
//:: Scrivener, Mid-Quest (Condition Script)
//:: H2c_Scrv_MidQues.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener has given its
     quest but is not currently a Follower.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bQuest = GetLocalInt(OBJECT_SELF, "bQuestGiven");
    object oMaster = GetMaster();

    if (bQuest == TRUE &&
        oMaster == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
