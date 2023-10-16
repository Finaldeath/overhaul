//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc hunted manticore successfully.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "os_manticorehunt")==30)
        return TRUE;
    return FALSE;
}
