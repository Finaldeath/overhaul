//::///////////////////////////////////////////////
//:: Know Haunted
//:: con_ser_knwhaunt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows the house is haunted
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD")==10;
    return iResult;
}
