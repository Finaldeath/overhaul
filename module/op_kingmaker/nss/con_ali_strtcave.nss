//::///////////////////////////////////////////////
//:: con_ali_strtcave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the caves, but has not done them
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    int nCave = GetLocalInt(GetFirstPC(),"os_serahcaves");
    iResult = nCave==10 || nCave==20;
    return iResult;
}
