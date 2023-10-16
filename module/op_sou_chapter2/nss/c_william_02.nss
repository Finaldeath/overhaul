//::///////////////////////////////////////////////
//:: William Rey (Condition - Area 02)
//:: C_William_02.nss
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

    if (sAreaTag == "Library_02")
    {
        return TRUE;
    }
    return FALSE;
}
