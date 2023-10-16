//::///////////////////////////////////////////////
//:: William Rey (Condition - Area 03b, Talked To)
//:: C_William_03b_T.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the conversation takes place
     in the rewritten romance novel area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Library_03b_bTalkedTo");

    if (sAreaTag == "Library_03b" && bTalkedTo == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
