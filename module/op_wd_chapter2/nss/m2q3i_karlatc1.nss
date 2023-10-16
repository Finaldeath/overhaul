//::///////////////////////////////////////////////
//:: m2q3I Karlat Condition Script #1
//:: m2q3I_KarlatC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if Karlat is in the area m2q3I.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if (sArea == "MAP_M2Q3IB")
    {
        return TRUE;
    }
    return FALSE;
}
