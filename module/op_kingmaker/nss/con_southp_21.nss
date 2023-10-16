//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC already received reward for
     freeing Stiletto.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    if (GetLocalInt(oEnivid,"OS_ENIVID_STILETTO")==30)
        return TRUE;
    return FALSE;
}

