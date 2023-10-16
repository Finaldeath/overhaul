//::///////////////////////////////////////////////
//:: m2q3G Mayor Mobley Condition Script #3
//:: m2q3G_MayorC3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if he's in area m2q3GG.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "M2Q3GCHARWOOD3")
    {
        return TRUE;
    }
    return FALSE;
}

