//::///////////////////////////////////////////////
//:: con_sti_knwrescu
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is on quest for Southpaw.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    int nFree = GetLocalInt(oEnivid,"OS_ENIVID_STILETTO");
    if (nFree==10)
        return TRUE;
    return FALSE;
}
