//::///////////////////////////////////////////////
//:: Karsus (Condition - Area 04a)
//:: C_Karsus_04a.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the conversation takes place
     in the original Hell area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);

    if (sAreaTag == "Library_04a")
    {
        return TRUE;
    }
    return FALSE;
}
