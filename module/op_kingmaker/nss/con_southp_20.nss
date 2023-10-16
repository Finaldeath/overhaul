//::///////////////////////////////////////////////
//:: Southpaw is voting for PC
//:: con_southp_20
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Southpas is voting for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_THIEVES_GUILD")==10;
    return iResult;
}
