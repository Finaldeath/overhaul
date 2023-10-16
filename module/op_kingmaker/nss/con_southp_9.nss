//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC freed Stiletto.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    int nFree = GetLocalInt(oEnivid,"OS_ENIVID_STILETTO");
    int nDanFree = GetLocalInt(GetFirstPC(),"os_freeprisoner");
    if (nFree==20 || nDanFree==20)
        return TRUE;
    return FALSE;
}
