//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc has poison blade from hive.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (os_CheckItem("q1_poisondagger"))
        return TRUE;
    return FALSE;
}
