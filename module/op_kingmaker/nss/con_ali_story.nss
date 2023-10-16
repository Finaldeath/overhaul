//::///////////////////////////////////////////////
//:: Alias Story
//:: con_ali_story
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is Lord and Alias can tell her story
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ALIAS_STORY")==10;
    return iResult;
}
