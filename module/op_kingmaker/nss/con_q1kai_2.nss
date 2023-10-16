//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has spoken to the Soul Harvester.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 7, 2001
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    if (GetLocalInt(GetFirstPC(),"OS_SPOKETOSOULHARVESTER")==10)
        return TRUE;
    return FALSE;
}
