//::///////////////////////////////////////////////
//:: William Rey (Condition - Area 05)
//:: C_William_05.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the conversation takes place
     in the Catching of the Wind area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);

    if (sAreaTag == "Library_05" ||
        sAreaTag == "Library_05a" ||
        sAreaTag == "Library_05b" ||
        sAreaTag == "Library_05c")
    {
        return TRUE;
    }
    return FALSE;
}
