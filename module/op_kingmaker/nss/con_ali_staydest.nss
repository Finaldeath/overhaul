//::///////////////////////////////////////////////
//:: Alias Waiting
//:: con_ali_staydest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Alias has been waiting at the destination
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST")==2;
    return iResult;
}
