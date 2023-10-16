//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc saved hermit.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oAlias = GetObjectByTag("q2_alias");
    if (GetLocalInt(GetFirstPC(), "OS_HELPDRUID")==99)
        return TRUE;
    return FALSE;
}

