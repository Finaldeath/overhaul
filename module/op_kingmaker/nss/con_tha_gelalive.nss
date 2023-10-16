//::///////////////////////////////////////////////
//:: Gelani Alive
//:: con_tha_gelalive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC hasn't killed Gelani yet
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_KILLGELANI")<20;
    return iResult;
}
