//::///////////////////////////////////////////////
//:: m2q3J Quint Condition Script #1
//:: m2q3J_QuintC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if Quint is in the area m2q3J.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "MAP_M2Q3JB")
    {
        return TRUE;
    }
    return FALSE;
}

