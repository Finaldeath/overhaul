//::///////////////////////////////////////////////
//:: con_thaddeus_1b
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Has typhus been spawned but not yet killed?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iTyphus = GetLocalInt(GetModule(),"OS_KILLTYPHUS");
    int iReturn = FALSE;

    if (iTyphus == 10)
    {
        iReturn = TRUE;
    }

    return iReturn;
}
