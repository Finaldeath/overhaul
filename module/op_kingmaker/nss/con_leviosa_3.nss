//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc is a member of the guild.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_pcjoinedforesters")==1)
        return TRUE;
    return FALSE;
}
