//::///////////////////////////////////////////////
//:: Karsus (Condition - Area 04a, Talked To)
//:: C_Karsus_04a_T.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the conversation takes place
     in the original Hell area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "Library_04a_bTalkedTo");

    if (sAreaTag == "Library_04a" && bTalkedTo == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
