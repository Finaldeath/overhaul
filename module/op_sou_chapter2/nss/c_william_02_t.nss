//::///////////////////////////////////////////////
//:: William Rey (Condition - Area 02, Talked To)
//:: C_William_02_T.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the conversation takes place
     in the original romance novel area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Library_02_bTalkedTo");

    if (sAreaTag == "Library_02" && bTalkedTo == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
