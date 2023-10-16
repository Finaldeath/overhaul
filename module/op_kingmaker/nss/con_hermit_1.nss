//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Trip or Kaidala told pc about drink
     or if pc figured it out.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oAlias = GetObjectByTag("q2_alias");
    if (GetLocalInt(GetFirstPC(), "OS_HELPDRUID")==10)
        return TRUE;
    return FALSE;
}
