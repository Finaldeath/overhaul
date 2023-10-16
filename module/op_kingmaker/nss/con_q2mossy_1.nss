//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC spoke to Mr Mossy before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 15, 2001
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    if (GetLocalInt(GetFirstPC(),"OS_SPOKETOMRMOSSY")==0)
        return TRUE;
    return FALSE;
}
