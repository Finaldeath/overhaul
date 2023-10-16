//::///////////////////////////////////////////////
//:: William Rey (Condition - Area 03b)
//:: C_William_03b.nss
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

    if (sAreaTag == "Library_03b")
    {
        return TRUE;
    }
    return FALSE;
}
