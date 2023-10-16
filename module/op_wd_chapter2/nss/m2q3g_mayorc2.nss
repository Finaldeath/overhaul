//::///////////////////////////////////////////////
//:: m2q3G Mayor Mobley Condition Script #2
//:: m2q3G_MayorC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if he's in area m2q3GB.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "M2Q3GCHARWOOD2")
    {
        return TRUE;
    }
    return FALSE;
}
