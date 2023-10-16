//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Plane of Sorrows Condition
//:: WW1_Hag_PoS_C
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this version of the Night Hag
     is in any of the Plane of Sorrows (not the
     Tour).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));

    if (sAreaTag == "PlaneofSorrows"  ||
        sAreaTag == "PlaneofSorrows2" ||
        sAreaTag == "PlaneofSorrows3")
    {
        return TRUE;
    }
    return FALSE;
}
