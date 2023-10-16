//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Dynschall votes for Enivid.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_templeguild_pc")>30
        ||GetLocalInt(GetFirstPC(),"os_templeguild_pc")==40
        ||GetLocalInt(GetFirstPC(),"os_templeguild_pc")==50
        ||GetLocalInt(GetFirstPC(),"os_templeguild_pc")==70
        ||GetLocalInt(GetFirstPC(),"os_templeguild_pc")==80)
        return TRUE;
    return FALSE;
}
