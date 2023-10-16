//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc is on the second quest to join the temple.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_jointemple_pc")<40
        && GetLocalInt(GetFirstPC(),"os_jointemple_pc")>29)
        return TRUE;
    return FALSE;
}
