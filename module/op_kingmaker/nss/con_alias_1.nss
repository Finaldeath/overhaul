//::///////////////////////////////////////////////
//:: con_alias_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC knows about caves.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_serahcaves")>0
        && GetLocalInt(GetFirstPC(),"os_serahcaves")<70)
        return TRUE;
    return FALSE;
}
