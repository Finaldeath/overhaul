//::///////////////////////////////////////////////
//:: Cage Locked
//:: con_hsl_locked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the door is locked
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oDoor = GetObjectByTag("q3ag_door_cage");
    iResult = GetLocked(oDoor);
    return iResult;
}
