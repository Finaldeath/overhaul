//::///////////////////////////////////////////////
//:: PC Enters Orb Room
//:: con_ohi_enterorb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has entered the orb room
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(OBJECT_SELF,"OS_OHIO_CAVES")==20;
    return iResult;
}
