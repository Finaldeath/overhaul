//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Enivid freed Stiletto.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"OS_ENIVID_FREE")==10)
        return TRUE;
    return FALSE;
}
