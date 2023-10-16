//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC did free Stiletto.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    if (GetLocalInt(oEnivid,"OS_ENIVID_STILETTO")==20)
        return TRUE;
    return FALSE;
}
