//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc hunted manticore failed.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "os_manticorehunt")==20)
        return TRUE;
    return FALSE;
}
