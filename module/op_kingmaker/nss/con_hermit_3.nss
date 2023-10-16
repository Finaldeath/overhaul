//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc is getting dagger from hive.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oAlias = GetObjectByTag("q2_alias");
    int nHelp = GetLocalInt(GetFirstPC(), "OS_HELPDRUID");
    if (nHelp==20 || nHelp == 15)
        return TRUE;
    return FALSE;
}
