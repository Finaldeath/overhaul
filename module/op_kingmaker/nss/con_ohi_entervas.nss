//::///////////////////////////////////////////////
//:: PC Enters Vase Room
//:: con_ohi_entervas
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has entered the vase room
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(OBJECT_SELF,"OS_OHIO_CAVES")==10;
    return iResult;
}
