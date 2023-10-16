//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc has the manticore skin.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "os_manticorehunt")>19&&
        GetLocalInt(GetModule(), "os_manticorehunt")<31)
        return TRUE;
    return FALSE;
}

