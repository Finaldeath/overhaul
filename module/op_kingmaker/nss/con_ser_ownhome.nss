//::///////////////////////////////////////////////
//:: PC Owns Home
//:: con_ser_ownhome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC already owns the haunted house
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 30
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") >= 20;
    return iResult;
}
