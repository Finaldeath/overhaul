//::///////////////////////////////////////////////
//:: Karsus (Condition - Area 04a, Not Talked To)
//:: C_Karsus_04a_F.nss
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

    if (sAreaTag == "Library_04a" && bTalkedTo == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Library_04a_bTalkedTo", TRUE);
        return TRUE;
    }
    return FALSE;
}
