//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Area Condition
//:: WW1_Mem_Area_C.nss
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
    string sTag = GetTag(oArea);

    if (sTag == "TheBattlefield")
    {
        return TRUE;
    }
    return FALSE;
}
