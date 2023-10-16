//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Glendir is safely returned.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q3_Glendir_Dead")==0
       && GetLocalInt(GetModule(),"q3_Glendir_Safe")==1)
        return TRUE;
    return FALSE;
}
