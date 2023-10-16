//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Condition Script #4
//:: m2q3H_Guardian4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the north door is still
    locked.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNorthDoor = GetObjectByTag("m2q3H_NorthDoor");

    if (GetLocked(oNorthDoor) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
