//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC spoke to Dead Jaboli before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 7, 2001
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    if (GetLocalInt(GetFirstPC(),"OS_SPOKETOJABOLIDEAD")==0)
        return TRUE;
    return FALSE;
}
