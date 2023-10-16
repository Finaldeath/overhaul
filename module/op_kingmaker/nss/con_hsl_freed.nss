//::///////////////////////////////////////////////
//:: Slave Freed
//:: con_hsl_freed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The slave has been freed and has reached the temple
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oArea = GetArea(OBJECT_SELF);

    iResult = GetTag(oArea)=="q2c17";
    return iResult;
}
