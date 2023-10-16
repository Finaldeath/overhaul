//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker, Area Condition
//:: WW1_Ragp_Area_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if in the Battlefield area
     rather than the Dawn area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sAreaTag = GetTag(oArea);
    string sMyTag = GetTag(OBJECT_SELF);

    if (sAreaTag == "TheBattlefield" &&
        sMyTag == "Ragpicker2")
    {
        return TRUE;
    }
    return FALSE;
}
