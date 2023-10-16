//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Fiona has spoken to PC before and
     Glendir is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q3_Glendir_Dead")==1
       && GetLocalInt(GetPCSpeaker(),"q3_Know_Smith")==1
       && GetLocalInt(GetModule(),"q3_Glendir_Told")==0)
        return TRUE;
    return FALSE;
}
