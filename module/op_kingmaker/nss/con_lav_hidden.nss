//::///////////////////////////////////////////////
//:: Hide Dialogue
//:: con_lav_hidden
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set to hide this dialogue for now
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"OS_LAVOS_VOTE")==99;
    return iResult;
}
