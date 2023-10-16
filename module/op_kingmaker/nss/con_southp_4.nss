//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is on quest for Southpaw.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    int nFree = GetLocalInt(oEnivid,"OS_ENIVID_STILETTO");
    if (nFree>=10 && nFree<30)
        return TRUE;
    return FALSE;
}
